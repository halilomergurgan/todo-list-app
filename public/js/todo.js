document.addEventListener("DOMContentLoaded", function() {
    const completeTaskLinks = document.querySelectorAll('.complete-task');
    const deleteTaskLinks = document.querySelectorAll('.delete-task');
    const revertTaskLinks = document.querySelectorAll('.revert-task');


    completeTaskLinks.forEach(link => {
        link.addEventListener('click', function(e) {
            e.preventDefault();
            if (confirm("Mark as completed?")) {
                window.location.href = this.href;
            }
        });
    });

    deleteTaskLinks.forEach(link => {
        link.addEventListener('click', function(e) {
            e.preventDefault();
            if (confirm("Are you sure you want to delete this task?")) {
                window.location.href = this.href;
            }
        });
    });

    revertTaskLinks.forEach(link => {
        link.addEventListener('click', function(e) {
            e.preventDefault();
            if (confirm("Revert to incomplete?")) {
                window.location.href = this.href;
            }
        });
    });
});

document.addEventListener("DOMContentLoaded", function() {
    const selectBox = document.querySelector('.add-task select');

    selectBox.addEventListener('change', function() {
        const selectedValue = this.value.toLowerCase();
        fetch(`/todos/filter?status=${selectedValue}`, {
            headers: {
                'X-Requested-With': 'XMLHttpRequest'
            }
        })
            .then(response => response.text())
            .then(html => {
                document.querySelector('.task-list').innerHTML = html;
            })
            .catch(error => console.log("Error fetching data:", error));
    });
});

