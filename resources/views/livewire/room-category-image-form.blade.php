<div>
<div>
<div class="modal-content">
        <form wire:submit.prevent="store" enctype="multipart/form-data">
            <!-- Modal Header -->
            <div class="modal-header">
            <h4 class="modal-title">Room Category</h4>
            <a type="button" class="close" data-dismiss="modal">&times;</a>
            </div>
            
            <!-- Modal body -->
            <div class=" modal-body">
            
                @if ($image_name)
                    Photo Preview:
                    <img src="{{ $isUploaded ? $image_name->temporaryUrl() :  url('storage/images/'.$image_name)  }}" width="250" height="300"> 
                @endif 
                <input type="text" wire:model.defer="room_category_id" name="room_category_id" class="form-control" >    
                <div class="custom-file mb-3">
                    <input  type="file"  wire:model.defer="image_name" name="image_name" class="form-control"  required>
                    @if($errors->has('image_name'))
                    <p style="color:red">{{$errors->first('image_name')}}</p>
                    @endif
                </div>


            </div>
            
            <!-- Modal footer -->
            <div class="modal-footer">
            <div class="form-group pb-xl-5 pull-right">
                <button type="submit" class="btn btn-primary">Save</button>
            </div>
            </div>
        </form>
    </div>
</div>

