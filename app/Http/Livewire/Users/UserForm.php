<?php

namespace App\Http\Livewire\Users;

use Livewire\Component;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rule;
use Spatie\Permission\Models\Role;

class UserForm extends Component
{
    public $name, $email, $username, $password, $password_confirmation, $userProfileId;
    public $roleCheck = array();
    public $selectedRoles = [];

    public $action = '';
    public $message = '';

    protected $listeners = [
        'userProfileId',
        'resetInputFields',
    ];

    public function resetInputFields()
    {
        $this->reset();
        $this->resetErrorBag();
    }

    
    public function render()
    {
        return view('livewire.users.user-form',[
            'roles' => Role::all()
        ]);
    }

    //edit
    public function userProfileId($userProfileId)
    {
        $this->userProfileId = $userProfileId;
        $userProfile = User::find($userProfileId);
        $this->name = $userProfile->name;
        $this->email = $userProfile->email;
        $this->username = $userProfile->username;
        $this->selectedRoles = $userProfile;
        // $this->selectedRoles = $this->selectedRoles->getRoleNames();
        $this->selectedRoles = json_decode(json_encode($this->selectedRoles->getRoleNames()), true);
        // $this->editRole = $userProfile->getRoleNames();
        // Fetch data into the roles which the userId ive got
    }


    public function store()
    {
        if(is_object($this->selectedRoles)){
            $this->selectedRoles = json_decode(json_encode($this->selectedRoles), true);
        }

        if(empty($this->roleCheck)){
            $this->roleCheck = array_map('strval', $this->selectedRoles);
        }

        $rules = [
            'name' => 'required',
            'email' => ['required', 'email', Rule::unique('users', 'email')->ignore($this->userProfileId)],
            'username' => ['required', Rule::unique('users', 'username')->ignore($this->userProfileId)],
        ];

        if (!$this->userProfileId) {
            $rules['password'] = 'required|same:password_confirmation|min:6';
            $rules['password_confirmation'] = 'required';
        }

        $data = $this->validate($rules);

        try {
            if ($this->userProfileId) {
                $user = User::find($this->userProfileId);
                $user->update($data);

                $user->syncRoles($this->roleCheck);
            } else {
                $data['password'] = Hash::make($this->password);
                $user = User::create($data);

                $user->assignRole($this->roleCheck);
            }
        } catch (\Exception $e) {
            return back();
            $action = 'error';
            $action = $e;
        }

        if ($this->userProfileId) {
            $action = 'edit';
            $message = 'User Successfully Updated';
            // dd($action);
            $this->emit('flashAction', $action, $message);
        } else {
            $action = 'store';
            $message = 'User Successfully Saved';
            // dd($action);
            $this->emit('flashAction', $action, $message);
        }

        $this->resetInputFields();
        $this->emit('refreshParent');
        $this->emit('closeModal');
    }

}
