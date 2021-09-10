<?php

namespace App\Http\Livewire;

use Livewire\Component;
use App\Models\RoomCategory;

class RoomCategoryForm extends Component
{

    public $roomcatId, $name, $description, $base_price;

    protected $listeners = [
        'roomcatId',
        'resetInputFields',
    ];

    public function resetInputFields(){
        $this->reset();
    }
    
    public function roomcatId($roomcatId){
        $this->roomcatId = $roomcatId;
        // dd($this->roomcatId);
        $roomCat = RoomCategory::find($roomcatId);
        $this->name = $roomCat->name; 
        $this->description = $roomCat->description; 
        $this->base_price = $roomCat->base_price; 
    }

    public function render()
    {
        return view('livewire.room-category-form');
    }

    public function store(){


        $action = '';

        $roomCategory = $this->validate([
            'name' => 'required',
            'description' => 'required',
            'base_price' => 'required|integer',
        ]);
        
        if($this->roomcatId){
            RoomCategory::find($this->roomcatId)->update($roomCategory);
            $action = 'edit';
        }else{
            RoomCategory::create($roomCategory);
            $action = 'store';
        }
        $this->emit('showEmitedFlashMessage', $action);
        $this->resetInputFields();
        $this->emit('refreshParent');
        $this->emit('closeRoomCategoryModal');

    }

    
}
