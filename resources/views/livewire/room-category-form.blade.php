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
            
                <div class="form-group">
                    <label>Category Name</label>
                    <input  type="text"  wire:model.defer="name" name="name" class="form-control"  required>
                    @if($errors->has('name'))
                    <p style="color:red">{{$errors->first('name')}}</p>
                    @endif
                </div>   

                <div class="form-group">
                    <label>Description</label>
                    <div>
                        <textarea wire:model="description" name="description" id="description"class="form-control" rows="3"></textarea>
                    </div>
                    @if($errors->has('description'))
                    <p style="color:red">{{$errors->first('description')}}</p>
                    @endif
                </div>   

                <div class="form-group">
                    <label>Base Price</label>
                    <input  type="text"  wire:model.defer="base_price" name="base_price" class="form-control" style="width:30%" required>
                    @if($errors->has('base_price'))
                    <p style="color:red">{{$errors->first('base_price')}}</p>
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
