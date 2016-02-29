$.ajax({
           type: "GET",
           contentType: "application/json; charset=utf-8",
           url: 'data',
           dataType: 'json',
           success: function (data) {
               draw(data);
           },
           error: function (result) {
               error();
           }
       });
 
function draw(data) {
    var color = d3.scale.category20b();
    var width = 620,
        barHeight = 20;

    console.log(data);
    a = [];
    for (i = 0; i < data.length; i++) {
        a.push(data[i].price);
    }
 
    var x = d3.scale.linear()
        .range([0,width])
        .domain([0, d3.max(a)]);
 
    var chart = d3.select("#graph")
        .attr("width", width)
        .attr("height", barHeight * a.length);

    var bar = chart.selectAll("g")
        .data(a)
        .enter().append("g")
        .attr("transform", function (d, i) {
                  return "translate(0," + i * barHeight + ")";
              });
 
    bar.append("rect")
        .attr("width", x)
        .attr("height", barHeight - 1)
        .style("fill", function (d) {
                   return color(d)
               })
 
    bar.append("text")
        .attr("x", function (d) {
                  return x(d) - 10;
              })
        .attr("y", barHeight / 2)
        .attr("dy", ".35em")
        .style("fill", "white")
        .text(function (d) {
                  return d;
              });
}
 
function error() {
    console.log("error")
}