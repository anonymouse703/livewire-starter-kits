<?php

namespace App\Http\Livewire\FlashMessage;

use Livewire\Component;

class FlashMessage extends Component
{
    public $message;

    protected $listeners = [
        'flashAction'
    ];


    public function flashAction($action, $message)
    {
        $this->message = $message;
        //  dd($action );
        if ($action == 'store') {
            session()->flash('success', $this->message);
        } elseif ($action == 'edit') {
            session()->flash('info', $this->message);
        } elseif ($action == 'refill') {
            session()->flash('refill', $this->message);
        } elseif ($action == 'delete') {
            session()->flash('delete', $this->message);
        } elseif ($action == 'outofstock') {
            session()->flash('outofstock', $this->message);
        } elseif ($action == 'delete') {
        dd("awea");
            session()->flash('delete', $this->message);
        } else {
            session()->flash('error', 'Record Store/Updated Unsuccessfully');
        }
    }
    
    public function render()
    {
        return view('livewire.flash-message.flash-message');
    }
}
