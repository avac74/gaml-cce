# Gaml Core Computation Engine

Gaml is a data science/machine learning framework, written in Dart.

The long term goal of Gaml is to provide the following set of modules:

- The Core Computation Engine (this package)
- A Dataframe Manipulation Engine (probably inspired by R and pandas)
- A graphics library, inspired by the Grammar of Graphics (by Leland Wilkinson) and by the Layered Grammar of Graphics (by Hadley Wickham)
- A Machine Learning toolkit

## The Core Computation Engine

### Purpose

The Core Computation Engine (CCE) implements a computation pipeline. Its purpose is to provide tools for interactive development by taking advantage of some of Dart's builtin features, in particular, the *hot reload* feature.

One important requirement for rapid development of data computation pipelines is *interactivity*. In that sense, programming languages with an interpreter have an advantage as interpreters provide a way to quickly experiment and interact with the data without the whole write-compile-run process.

CCE allows one to connect *computation nodes* between a data source and a sink. Moreover, once you run the program in debug mode, the CCE begins to monitor the source code used to build the pipeline. Whenever a change happens, Dart's VM will hot reload the code and the engine will recompute all nodes, automatically.

The following features are (a few of) the things in the short term roadmap:
- The ability to tag computation nodes so that they are not recomputed if not needed (for example, nodes that spend a lot of time loading files and cleaning data usually only need to do that once)
- Async nodes, streams and using Isolates to make computations in parallel
- Extend/write a plugin for VS Code to improve the user experience while writing code using CCE, in particular:
  - Snippets for wrapping nodes in other nodes
  - A tool to visualize the computation tree, much like the DevTools for Flutter