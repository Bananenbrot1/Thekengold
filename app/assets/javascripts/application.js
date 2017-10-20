// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require jquery3
//= require Chart.min
//= require_tree .
$(document).on('turbolinks:load', function() {


  var female = document.getElementById("femaleChart");
  var male = document.getElementById("maleChart");
  var maleChart = new Chart(male, {
      type: 'bar',
      data: {
          labels: gon.maleteamsLabels,
          datasets: [{
              label: 'Herren',
              data: gon.maleteamsAmount,
              backgroundColor: [
                  'rgba(132, 79, 33, 1.0)',
                  'rgba(255, 0, 246, 1.0)',
                  'rgba(21, 16, 145, 1.0)',
                  'rgba(19, 146, 17, 1.0)',
                  'rgba(153, 102, 255, 1)',
                  'rgba(178, 145, 255, 1.0)',
                  'rgba(30, 217, 255, 1.0)',
                  'rgba(237, 28, 28, 1.0)',
                  'rgba(238, 242, 14, 1.0)'
              ],
              borderColor: [
                  'rgba(255,99,132,1)',
                  'rgba(54, 162, 235, 1)',
                  'rgba(255, 206, 86, 1)',
                  'rgba(75, 192, 192, 1)',
                  'rgba(153, 102, 255, 1)',
                  'rgba(255, 159, 64, 1)'
              ],
              borderWidth: 1
          }]
      },
      options: {
          animation: {
              duration: 0
          },
          scales: {
              yAxes: [{
                  ticks: {
                      beginAtZero:true
                  }
              }]
          }
      }
  });
  var femaleChart = new Chart(female, {
      type: 'bar',
      data: {
          labels: gon.femaleteamsLabels,
          datasets: [{
              label: 'Damen',
              data: gon.femaleteamsAmount,
              backgroundColor: [
                'rgba(19, 146, 17, 1.0)',
                'rgba(132, 79, 33, 1.0)',
                'rgba(21, 16, 145, 1.0)',
                'rgba(30, 217, 255, 1.0)',
                'rgba(237, 28, 28, 1.0)',
                'rgba(178, 145, 255, 1.0)',
                'rgba(238, 242, 14, 1.0)',
                'rgba(255, 255, 255, 1.0)',
                'rgba(255, 165, 0, 1.0)',
                'rgba(255, 0, 246, 1.0)'
              ],
              borderColor: [
                  'rgba(255,99,132,1)',
                  'rgba(54, 162, 235, 1)',
                  'rgba(255, 206, 86, 1)',
                  'rgba(75, 192, 192, 1)',
                  'rgba(153, 102, 255, 1)',
                  'rgba(255, 159, 64, 1)'
              ],
              borderWidth: 1
          }]
      },
      options: {
          animation: {
              duration: 0
          },
          scales: {
              yAxes: [{
                  ticks: {
                      beginAtZero:true
                  }
              }]
          }
      }
  });
});
