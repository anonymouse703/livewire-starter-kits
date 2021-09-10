<?php

namespace App\Http\Livewire;

use Livewire\Component;
use App\Models\Client;
use App\Models\Gender;
use App\Models\Status;
use App\Models\User;

class ClientForm extends Component
{
    public $clientId, $firstname, $middlename, $lastname, $suffix, $email, $contact_number, $nationality, $gender, $street,
    $barangay, $city, $province, $birthdate, $status, $user;

    protected $listeners = [
        'clientId',
        'resetInputFields'
    ];

    public function resetInputFields(){
        $this->reset();
    }

    public function clientId($clientId){
        $this->clientId = $clientId;
        // dd($this->clientId);
        $civil = Client::find($clientId);
        $this->firstname = $civil->firstname;
        $this->middlename = $civil->middlename;
        $this->lastname = $civil->lastname;
        $this->suffix = $civil->suffix;
        $this->email = $civil->email;
        $this->contact_number = $civil->contact_number;
        $this->nationality = $civil->nationality;
        $this->gender = $civil->gender;
        $this->street = $civil->street;
        $this->barangay = $civil->barangay;
        $this->city = $civil->city;
        $this->province = $civil->province;
        $this->birthdate = $civil->birthdate;
        $this->status = $civil->status;
        $this->user = $civil->user;
    }

    public function render()
    {
        $genders = Gender::get()->all();
        $statuses = Status::whereIn('id',[10,11])->get();
        $users = User::get()->all();
        return view('livewire.client-form')
            ->with('genders',$genders)
            ->with('statuses',$statuses)
            ->with('users',$users);
    }

    public function store(){

        $action = '';

        $data = $this->validate([
            'firstname' => 'required',
            'middlename' => 'required',
            'lastname' => 'required',
            'suffix' => 'nullable',
            'email' => 'required',
            'contact_number' => 'required',
            'nationality' => 'required',
            'gender' => 'required',
            'street' => 'required',
            'barangay' => 'required',
            'city' => 'required',
            'province' => 'required',
            'birthdate' => 'required',
            'status' => 'required',
            'user' => 'nullable',
        ]);
        if($this->clientId){
            Client::find($this->clientId)->update($data);
            $action = 'edit';
        }else{
            Client::create($data);
            $action = 'store';
        }
        $this->emit('showEmitedFlashMessage', $action);
        $this->resetInputFields();
        $this->emit('refreshParent');
        $this->emit('closeClientModal');

    }
}
