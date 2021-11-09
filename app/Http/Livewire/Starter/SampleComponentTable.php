<?php

namespace App\Http\Livewire\Starter;

use Livewire\Component;
use App\Models\Sample;

class SampleComponentTable extends Component
{

    public $sampleId ;

    protected $listeners = [
        'refreshParent' => '$refresh',
        'deleteSample',
    ];

    public function render()
    {
        return view('livewire.starter.sample-component-table',[
            'samples' => Sample::all()
        ]);
    }

    public function createSample(){
        $this->emit('resetInputFields');
        $this->emit('openSampleModal');
    }

    
    public function editSample($sampleId){
        $this->sampleId = $sampleId;
        $this->emit('sampleId',$this->sampleId);
        $this->emit('openSampleModal');
    }

    public function deleteConfirmSample($sampleId){

        // $this->dispatchBrowserEvent(event('swal:confirmCotactDelete'));
        $this->dispatchBrowserEvent('swal:confirmSampleDelete', [
            'title' => 'Are you sure?',
            'text' => "You won't be able to revert this!",
            'icon' => 'warning',
            'showCancelButton' => true,
            'confirmButtonColor' => '#3085d6',
            'cancelButtonColor' => '#d33',
            'confirmButtonText' => 'Yes, delete it!',
            'id' => $sampleId
        ]);
    }

    public function deleteSample($sampleId){
        
        Sample::destroy($sampleId);
        $this->resetPage();
    }
}
