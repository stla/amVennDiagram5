var allDiagrams = [
  [
    {
      "name": "A",
      "count": 2
    },
    {
      "name": "B",
      "count": 2
    },
    {
      "name": "C",
      "count": 1
    },
    {
      "name": "A:B",
      "count": 0,
      "sets": ["A", "B"]
    },
    {
      "name": "A:C",
      "count": 0,
      "sets": ["A", "C"]
    },
    {
      "name": "B:C",
      "count": 0,
      "sets": ["B", "C"]
    },
    {
      "name": "A:B:C",
      "count": 0,
      "sets": ["A", "B", "C"]
    }
  ],
  [
    {
      "name": "A",
      "count": 2
    },
    {
      "name": "B",
      "count": 2
    },
    {
      "name": "C",
      "count": 1
    },
    {
      "name": "A:B",
      "count": 0,
      "sets": ["A", "B"]
    },
    {
      "name": "A:C",
      "count": 1,
      "sets": ["A", "C"]
    },
    {
      "name": "B:C",
      "count": 0,
      "sets": ["B", "C"]
    },
    {
      "name": "A:B:C",
      "count": 0,
      "sets": ["A", "B", "C"]
    }
  ],
  [
    {
      "name": "A",
      "count": 2
    },
    {
      "name": "B",
      "count": 2
    },
    {
      "name": "C",
      "count": 1
    },
    {
      "name": "A:B",
      "count": 1,
      "sets": ["A", "B"]
    },
    {
      "name": "A:C",
      "count": 0,
      "sets": ["A", "C"]
    },
    {
      "name": "B:C",
      "count": 0,
      "sets": ["B", "C"]
    },
    {
      "name": "A:B:C",
      "count": 0,
      "sets": ["A", "B", "C"]
    }
  ],
  [
    {
      "name": "A",
      "count": 2
    },
    {
      "name": "B",
      "count": 2
    },
    {
      "name": "C",
      "count": 1
    },
    {
      "name": "A:B",
      "count": 1,
      "sets": ["A", "B"]
    },
    {
      "name": "A:C",
      "count": 1,
      "sets": ["A", "C"]
    },
    {
      "name": "B:C",
      "count": 0,
      "sets": ["B", "C"]
    },
    {
      "name": "A:B:C",
      "count": 0,
      "sets": ["A", "B", "C"]
    }
  ],
  [
    {
      "name": "A",
      "count": 2
    },
    {
      "name": "B",
      "count": 2
    },
    {
      "name": "C",
      "count": 1
    },
    {
      "name": "A:B",
      "count": 2,
      "sets": ["A", "B"]
    },
    {
      "name": "A:C",
      "count": 0,
      "sets": ["A", "C"]
    },
    {
      "name": "B:C",
      "count": 0,
      "sets": ["B", "C"]
    },
    {
      "name": "A:B:C",
      "count": 0,
      "sets": ["A", "B", "C"]
    }
  ],
  [
    {
      "name": "A",
      "count": 2
    },
    {
      "name": "B",
      "count": 2
    },
    {
      "name": "C",
      "count": 1
    },
    {
      "name": "A:B",
      "count": 0,
      "sets": ["A", "B"]
    },
    {
      "name": "A:C",
      "count": 0,
      "sets": ["A", "C"]
    },
    {
      "name": "B:C",
      "count": 1,
      "sets": ["B", "C"]
    },
    {
      "name": "A:B:C",
      "count": 0,
      "sets": ["A", "B", "C"]
    }
  ],
  [
    {
      "name": "A",
      "count": 2
    },
    {
      "name": "B",
      "count": 2
    },
    {
      "name": "C",
      "count": 1
    },
    {
      "name": "A:B",
      "count": 1,
      "sets": ["A", "B"]
    },
    {
      "name": "A:C",
      "count": 1,
      "sets": ["A", "C"]
    },
    {
      "name": "B:C",
      "count": 1,
      "sets": ["B", "C"]
    },
    {
      "name": "A:B:C",
      "count": 1,
      "sets": ["A", "B", "C"]
    }
  ],
  [
    {
      "name": "A",
      "count": 2
    },
    {
      "name": "B",
      "count": 2
    },
    {
      "name": "C",
      "count": 1
    },
    {
      "name": "A:B",
      "count": 1,
      "sets": ["A", "B"]
    },
    {
      "name": "A:C",
      "count": 0,
      "sets": ["A", "C"]
    },
    {
      "name": "B:C",
      "count": 1,
      "sets": ["B", "C"]
    },
    {
      "name": "A:B:C",
      "count": 0,
      "sets": ["A", "B", "C"]
    }
  ],
  [
    {
      "name": "A",
      "count": 2
    },
    {
      "name": "B",
      "count": 2
    },
    {
      "name": "C",
      "count": 1
    },
    {
      "name": "A:B",
      "count": 2,
      "sets": ["A", "B"]
    },
    {
      "name": "A:C",
      "count": 1,
      "sets": ["A", "C"]
    },
    {
      "name": "B:C",
      "count": 1,
      "sets": ["B", "C"]
    },
    {
      "name": "A:B:C",
      "count": 1,
      "sets": ["A", "B", "C"]
    }
  ]
];

am5.ready(function () {
  // Create root
  var root = am5.Root.new("chartdiv");
  // Create wrapper container
  var container = root.container.children.push(
    am5.Container.new(root, {
      width: am5.p100,
      height: am5.p100,
      layout: root.horizontalLayout
    })
  );
  // Create venn series
  var chart = container.children.push(
    am5venn.Venn.new(root, {
      categoryField: "name",
      valueField: "count",
      intersectionsField: "sets",
      paddingTop: 40,
      paddingBottom: 40,
      paddingLeft: 40,
      paddingRight: 40
    })
  );
  // Set data
  chart.data.setAll(allDiagrams[0]);
  // Labels
  chart.labels.template.setAll({
    fontSize: 20,
    fill: am5.color(0x000000),
    text: "[bold]{category}[/]"
  });
  // Set tooltip content
  chart.slices.template.set(
    "tooltipText",
    "[bold]{category}[/] [bold underline fontStyle: italic]{value}[/]"
  );
  // Set slices settings
  chart.slices.template.setAll({
    fillOpacity: 0.5,
    stroke: am5.color(0x000000),
    strokeWidth: 2
  });
  // Set up hover appearance
  chart.hoverGraphics.setAll({
    strokeDasharray: [3, 3],
    stroke: am5.color(0xffffff),
    strokeWidth: 2
  });
  // Add legend
  var legend = container.children.push(
    am5.Legend.new(root, {
      layout: root.verticalLayout,
      centerX: am5.p100,
      x: am5.p100,
      centerY: am5.p50,
      y: am5.p50
    })
  );
  legend.data.setAll(chart.dataItems);
});
