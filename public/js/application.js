$(document).ready(function() {
  var teams = [];

  $.ajax({
    url: "https://www.kimonolabs.com/api/dp2fr06w?apikey=RVGH7NXcr496gz5BGNjs805SWZvp2ATs",
    method: "GET",
    dataType: "jsonp"
  })
  .done(function(data){
    team_names = [];
    $.map(data["results"]["nflTeams"], function(team, index){
      team_names.push(team["teamName"]["text"]);
    });
    console.log(team_names);


  });
});
