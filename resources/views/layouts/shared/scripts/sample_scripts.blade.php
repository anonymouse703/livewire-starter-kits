<script>

//Contacts

$(document).ready(function() {
    $('#sampleTable').DataTable({
        "pagingType": "full_numbers",
        stateSave: true
    });
} );

window.livewire.on('closeSampleModal', () => {
    $('#sampleModal').modal('hide');
});

window.livewire.on('openSampleModal', () => {
    $('#sampleModal').modal('show');
});

//delete contact
window.addEventListener('swal:confirmSampleDelete', event => {
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
        window.livewire.emit('deleteSample',event.detail.id)
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