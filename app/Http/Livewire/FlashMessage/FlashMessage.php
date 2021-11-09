<?php

namespace App\Http\Livewire\FlashMessage;

use Livewire\Component;

class FlashMessage extends Component
{
    public $message;

    protected $listeners = [
        'flashAction'
    ];

    public function flashAction($action,$message)
    {
       
        $this->message = $message;
        //  dd($action );
        if($action == 'store') {
            session()->flash('success', $this->message);
        } elseif($action == 'edit'){
            session()->flash('success', $this->message);
        }
        else{
            session()->flash('error','Record Store/Updated Unsuccessfully');
        }    
    }
    
    public function render()
    {
        return view('livewire.flash-message.flash-message');
    }
}
