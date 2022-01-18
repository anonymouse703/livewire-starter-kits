<?php

namespace App\Http\Livewire\Users;

use Livewire\Component;
use App\Models\User;
use Livewire\WithPagination;


class UserTable extends Component
{   
    use WithPagination;

    public $userProfileId;

    protected $listeners = [
        'refreshParent' => '$refresh',
        'deleteUserProfile',
    ];

    public function render()
    {
        return view('livewire.users.user-table',[
            'users' => User::all()
        ]);
    }

    public function createUserProfile()
    {
        $this->emit('resetInputFields');
        $this->emit('openUserModal');
    }

    public function editUserProfile($userProfileId)
    {
        $this->emit('resetInputFields');
        $this->userProfileId = $userProfileId;
        $this->emit('userProfileId', $this->userProfileId);
        $this->emit('openUserModal');
    }

    public function deleteConfirmUserProfile($userProfileId)
    {
        $this->dispatchBrowserEvent('swal:confirmUserProfileDelete', [
            'title' => 'Are you sure?',
            'text' => "You won't be able to revert this!",
            'icon' => 'warning',
            'showCancelButton' => true,
            'confirmButtonColor' => '#3085d6',
            'cancelButtonColor' => '#d33',
            'confirmButtonText' => 'Yes, delete it!',
            'id' => $userProfileId
        ]);
    }

    public function deleteUserProfile($userProfileId)
    {
        User::destroy($userProfileId);
        $this->resetPage();
    }

    
}
