async function updateSelectField(selectField) {
  let selectedValue = selectField.value

  try {
    let data = await fetch('/student_classes/get_teachers').then(response => {
      if (!response.ok) {
        let errorMessage = `HTTP status: ${response.status}, ${response.statusText}`
        throw new Error(errorMessage)
      }
      return response.json()
    })

    data.options.unshift({ value: 0, text: 'Select teacher' });

    selectField.innerHTML = data.options.map(option => `<option value="${option.value}">${option.text}</option>`).join('')
    selectField.value = selectedValue
  } catch (error) {
    console.error('Error fetching data:', error)
  }
}

document.addEventListener('DOMContentLoaded', function() {
  let selectField = document.getElementById('dynamic-select')

  selectField.addEventListener('click', function() {
    updateSelectField(selectField)
  })
})
