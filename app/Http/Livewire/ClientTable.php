<?php

namespace App\Http\Livewire;

use Livewire\Component;
use App\Models\Client;
use Livewire\WithPagination;

class ClientTable extends Component
{
    use WithPagination;

    public $clientId;

    protected $listeners = [
        'refreshParent' => '$refresh',
        'deleteClient',
        'showEmitedFlashMessage'
    ];

    public function showEmitedFlashMessage($action)
    {
        if($action == 'edit') {
            session()->flash('edit','Client Updated Successfully.');
        } else {
            session()->flash('store','Client Created Successfully.');
        }    
    }

    public function render()
    {
        return view('livewire.client-table',[
            'clients' => Client::all()->sortBy('id')
        ]);
    }

    public function createClient(){
        $this->emit('resetInputFields');
        $this->emit('openClientModal');
    }

    
    public function editClient($clientId){
        $this->clientId = $clientId;
        $this->emit('clientId',$this->clientId);
        $this->emit('openClientModal');
    }

    public function deleteConfirmClient($clientId){

        // $this->dispatchBrowserEvent(event('swal:confirmCotactDelete'));
        $this->dispatchBrowserEvent('swal:confirmClientDelete', [
            'title' => 'Are you sure?',
            'text' => "You won't be able to revert this!",
            'icon' => 'warning',
            'showCancelButton' => true,
            'confirmButtonColor' => '#3085d6',
            'cancelButtonColor' => '#d33',
            'confirmButtonText' => 'Yes, delete it!',
            'id' => $clientId
        ]);
    }

    public function deleteClient($clientId){
        // dd($clientId);
        Client::destroy($clientId);
        $this->resetPage();
        // return redirect()->route('client');
    }
}
