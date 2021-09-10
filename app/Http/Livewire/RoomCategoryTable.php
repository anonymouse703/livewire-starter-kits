<?php

namespace App\Http\Livewire;

use Livewire\Component;
use App\Models\RoomCategory;
use Livewire\WithPagination;

class RoomCategoryTable extends Component
{
    use WithPagination;

    public $roomcatId;

    protected $listeners = [
        'refreshParent' => '$refresh',
        'deleteRoomCategory',
        'showEmitedFlashMessage'
    ];

    public function showEmitedFlashMessage($action)
    {
        if($action == 'edit') {
            session()->flash('edit','Room Category Updated Successfully.');
        } else {
            session()->flash('store','Room Category Created Successfully.');
        }    
    }

    public function render()
    {
        return view('livewire.room-category-table',[
            'rooms' => RoomCategory::with('images')->get()->sortBy('id')
        ]);
    }

    public function createRoomCategory(){
        $this->emit('resetInputFields');
        $this->emit('openRoomCategoryModal');
    }

    
    public function editRoomCategory($roomcatId){
        $this->roomcatId = $roomcatId;
        $this->emit('roomcatId',$this->roomcatId);
        $this->emit('openRoomCategoryModal');
    }

    public function addRoomCategoryImage($roomcatId){
        $this->roomcatId = $roomcatId;
        $this->emit('roomcatId',$this->roomcatId);
        $this->emit('openRoomCategoryImageModal');
    }

    public function deleteConfirmRoomCategory($roomcatId){

        // $this->dispatchBrowserEvent(event('swal:confirmCotactDelete'));
        $this->dispatchBrowserEvent('swal:confirmRoomCategoryDelete', [
            'title' => 'Are you sure?',
            'text' => "You won't be able to revert this!",
            'icon' => 'warning',
            'showCancelButton' => true,
            'confirmButtonColor' => '#3085d6',
            'cancelButtonColor' => '#d33',
            'confirmButtonText' => 'Yes, delete it!',
            'id' => $roomcatId
        ]);
    }

    public function deleteRoomCategory($roomcatId){
        // dd($roomcatId);
        RoomCategory::destroy($roomcatId);
        $this->resetPage();
    }
}
