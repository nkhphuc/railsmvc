document.addEventListener('DOMContentLoaded', function() {
  const selectField = document.getElementById('dynamic-select');

  selectField.addEventListener('click', function() {
    const selectedValue = selectField.value; // Store the currently selected value
    // Send an AJAX request to fetch updated options
    fetch('/student_classes/get_teachers')
    .then(response => {
      if (!response.ok) {
        throw new Error('Network response was not ok');
      }
      return response.json();
    })
    .then(data => {
      const options = data.options;
      selectField.innerHTML = ''; // Clear existing options
      // Populate select field with updated options
      options.forEach(option => {
        const optionElement = document.createElement('option');
        optionElement.value = option.value;
        optionElement.textContent = option.text;
        selectField.appendChild(optionElement);
      });
      // Re-select the previously selected value
      selectField.value = selectedValue;
    })
    .catch(error => {
      console.error('Error fetching data:', error);
      // Handle the error here, e.g., show an alert or update a status message
    });
  });
});
