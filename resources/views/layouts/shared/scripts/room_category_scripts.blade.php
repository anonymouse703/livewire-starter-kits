<script>

//Contacts

$(document).ready(function() {
    $('#roomCategoryTable').DataTable({
        "pagingType": "full_numbers"
    });
} );

window.livewire.on('closeRoomCategoryModal', () => {
    $('#roomCategoryModal').modal('hide');
});

window.livewire.on('openRoomCategoryModal', () => {
    $('#roomCategoryModal').modal('show');
});

window.livewire.on('closeRoomCategoryImageModal', () => {
    $('#roomCategoryImageModal').modal('hide');
});

window.livewire.on('openRoomCategoryImageModal', () => {
    $('#roomCategoryImageModal').modal('show');
});

//delete contact
window.addEventListener('swal:confirmRoomCategoryDelete', event => {
    swal.fire({
        title: event.detail.title,
        text: event.detail.text,
        icon: event.detail.icon,
        showCancelButton: event.detail.showCancelButton,
        confirmButtonColor: event.detail.confirmButtonColor,
        cancelButtonColor: event.detail.cancelButtonColor,
        confirmButtonText: event.detail.confirmButtonText,
    }).then((result) => {
    if (result.isConfirmed) {
        window.livewire.emit('deleteRoomCategory',event.detail.id)
        swal.fire(
        'Deleted!',
        'Your file has been deleted.',
        'success'
        )
    }
    });
});

//

</script>