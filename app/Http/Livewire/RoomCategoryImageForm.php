<?php

namespace App\Http\Livewire;

use Livewire\Component;
use Livewire\WithFileUploads;
use App\Models\RoomCategoryImage;

class RoomCategoryImageForm extends Component
{
    use WithFileUploads;

    public $roomcatId, $room_category_id, $image_name;

    public $isUploaded = false;

    protected $listeners = [
        'roomcatId',
        'resetInputFields',
    ];

    public function resetInputFields(){
        $this->reset();
    }
    public function updatedImageName(){
        $this->isUploaded=true;
    }
    
    public function roomcatId($roomcatId){
        $this->room_category_id = $roomcatId;
    }
    
    public function render()
    {
        return view('livewire.room-category-image-form');

       
    }

    public function store(){


        $action = '';
        
        $roomCategoryImage = $this->validate([
            'image_name' => 'image|max:1024',
            'room_category_id' => 'required',
        ]);

        if(!empty($this->image_name)){
            $image_name = 'image_name.' . time() . $this->image_name->getClientOriginalName();
    
            $this->image_name->storeAs('public/images', $image_name);
    
            $roomCategoryImage['image_name'] = $image_name;
        }


        if($this->roomcatId){
            RoomCategoryImage::where('room_category_id',$this->roomcatId)->update($roomCategoryImage);
            $action = 'edit';
        }else{
            RoomCategoryImage::create($roomCategoryImage);
            $action = 'store';
        }
        $this->emit('showEmitedFlashMessage', $action);
        $this->resetInputFields();
        $this->emit('refreshParent');
        $this->emit('closeRoomCategoryImageModal');

    }
}
