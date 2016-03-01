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
function draw(data){
  // width and height 
    var w = 800;
    var h = 400;
    var barPadding = 1;

  // pulls price out of every record to graph
   a = [];
    for (i = 0; i < data.length; i++) {
        a.push(data[i].price);
    }
    console.log(a);
  // var data  = [ 5, 10, 13, 19, 21, 25, 22, 18, 15, 13,11, 12, 15, 20, 18, 17, 16, 18, 23, 25 ];
  // var a = [ 5, 10, 13, 19, 21, 25, 22, 18, 15, 13,11, 12, 15, 20, 18, 17, 16, 18, 23, 25, 70 ];
  // select svg element
    var svg = d3.select("#graph")
                .attr("width", w)
                .attr("height", h);

  // creating rect's inside the svg
    svg.selectAll("rect")
          .data(a)
          .enter()
          .append("rect")
          .attr("class","bar")
          // creatin a rect's location dynamic on the x coordinate 
          .attr("x", function(d,i){
            return i * (w / a.length);
          })
          // flipping the graph 
          // the "y" / number should be the same as with "height" / number
          .attr("y", function(d){
            return h - d / 30;
          })

          .attr("width", w / a.length - barPadding)
          // making rect height dynamic adjust d/ number to increase or decrease bar height
          .attr("height", function(d) {
            return d / 30;
          })
          // rect colors
          .attr("fill","steelblue");

          // adding text 
          svg.selectAll("text")
            .data(a)
            .enter()
            .append("text")
            .text(function(d){
              return "$"+(d3.round(d));
            })

            // position text on the x axis
            .attr("x", function(d,i){
              return i * (w / a.length) + 5;
            })

            // position text y axis
            .attr("y", function(d){
              return h - (d / 30) +15;
            })
            .attr("class","chart_text")
            .attr("font-family", "Arial")
            .attr("font-size", "11px")
            .attr("fill", "white");
}
 
// function draw(data) {
//     var color = d3.scale.category20b();
//     var width = 620,
//         barHeight = 20;

//     console.log(data);
//     a = [];
//     for (i = 0; i < data.length; i++) {
//         a.push(data[i].price);
//     }
 
//     var x = d3.scale.linear()
//         .range([0,width])
//         .domain([0, d3.max(a)]);
 
//     var chart = d3.select("#graph")
//         .attr("width", width)
//         .attr("height", barHeight * a.length);

//     var bar = chart.selectAll("g")
//         .data(a)
//         .enter().append("g")
//         .attr("transform", function (d, i) {
//                   return "translate(0," + i * barHeight + ")";
//               });
 
//     bar.append("rect")
//         .attr("width", x)
//         .attr("height", barHeight - 1)
//         .style("fill", function (d) {
//                    return color(d)
//                })
 
//     bar.append("text")
//         .attr("x", function (d) {
//                   return x(d) - 10;
//               })
//         .attr("y", barHeight / 2)
//         .attr("dy", ".35em")
//         .style("fill", "white")
//         .text(function (d) {
//                   return d;
//               });
// }
 
// function error() {
//     console.log("error")
// }