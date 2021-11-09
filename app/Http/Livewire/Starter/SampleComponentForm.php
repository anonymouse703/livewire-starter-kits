<?php

namespace App\Http\Livewire\Starter;
use App\Models\Sample;

use Livewire\Component;

class SampleComponentForm extends Component
{
    public $slug, $sampleId, $name;
    public $action = '';
    public $message = '';

    protected $listeners = [
        'sampleId',
        'resetInputFields'
    ];

    public function resetInputFields(){
        $this->reset();
    }
    
    public function sampleId($sampleId){
        $this->sampleId = $sampleId;
        $data = Sample::find($sampleId);
        $this->name = $data->name;
    }

    public function render()
    {
        return view('livewire.starter.sample-component-form');
    }

    public function store(){

        $data = $this->validate([
            'name' => 'required',
        ]);

        try
		{
            if($this->sampleId){
                Sample::find($this->sampleId)->update($data);
            }else{
                Sample::create($data);
            }

		} catch (\Exception $e) {
			// dd($e);
			return back();
            $action = 'error';
		}

        if($this->sampleId){
            $action = 'edit';
            $message = 'Permission Successfully Updated';
            // dd($action);
            $this->emit('flashAction',$action,$message);
        }
        else{
            $action = 'store';
            $message = 'Permission Successfully Saved';
            // dd($action);
            $this->emit('flashAction',$action,$message);
            
        }
        
        $this->resetInputFields();
        $this->emit('refreshParent');
        $this->emit('closeSampleModal');
    }
}
