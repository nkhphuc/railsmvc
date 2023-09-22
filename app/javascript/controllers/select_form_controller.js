// import { Controller } from "@hotwired/stimulus"
// import { get } from "@rails/request.js"

// // Connects to data-controller="student-class-form"
// export default class extends Controller {
//   change(event) {
//     const selectField = document.getElementById('dynamic-select')
//     const selectedValue = selectField.value

//     get('/student_classes/get_teachers')
//     .then(response => {
//       if (response.ok) {
//         return response.json
//       } else {
//         throw new Error('Network response was not ok');
//       }
//     })
//     .then(json => {
//       const options = json.options
//       selectField.innerHTML = ''
//       options.forEach(option => {
//         const optionElement = document.createElement('option')
//         optionElement.value = option.value
//         optionElement.textContent = option.text
//         selectField.appendChild(optionElement)
//       })
//       selectField.value = selectedValue
//     })
//     .catch(error => {
//       console.error('Error fetching data:', error)
//     })
//   }
// }

// import { Controller } from "@hotwired/stimulus"
// import { get } from "@rails/request.js"

// // Connects to data-controller="student-class-form"
// export default class extends Controller {
//   static targets = ['select']
//   static values = { url: String }

//   change(event) {
//     get(`${this.urlValue}?selected=${this.selectTarget.value}`, {
//       responseKind: 'turbo-stream'
//     })
//     .then(response => {
//       if (!response.ok) {
//         throw new Error('Network response was not ok');
//       }
//     })
//     .catch(error => {
//       console.error('Error fetching data:', error)
//     })
//   }
// }


import { Controller } from "@hotwired/stimulus"
import { get } from "@rails/request.js"

// Connects to data-controller="student-class-form"
export default class extends Controller {
  static targets = ['select']
  static values = { url: String }

  change(event) {
    get(`${this.urlValue}?selected=${this.selectTarget.value}`, {
      responseKind: 'turbo-stream'
    })
    .catch(error => {
      if (error.response) {
        console.error('Error status:', error.response.status)
        console.error('Error data:', error.response.data)
      } else if (error.request) {
        console.error('Error request:', error.request)
      } else {
        console.error('Error message:', error.message)
      }
    })
  }
}
