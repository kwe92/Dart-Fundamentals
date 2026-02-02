class Token {
  final String _type;
  Token(this._type);

  @override
  String toString() => "Token($_type)";
}

class Bytecode {
  final String _instruction;
  Bytecode(this._instruction);

  @override
  String toString() => _instruction;
}

class BytecodeStream {
  final List<Bytecode> _buffer = [];

  void add(Bytecode code) {
    _buffer.add(code);
    print("Stream received bytecode: $code");
  }
}

class InputStream {
  final String _data;
  InputStream(this._data);
}

class Scanner {
  final InputStream _inputStream;

  Scanner(this._inputStream);

  Token scan() {
    return Token("VAR_DEF");
  }
}

abstract class CodeGenerator {
  void visitStatement(StatementNode node);
  void visitExpression(ExpressionNode node);
}

abstract class ProgramNode {
  void add(ProgramNode node);
  void remove(ProgramNode node);

  void traverse(CodeGenerator cg);
}

class StatementNode extends ProgramNode {
  final List<ProgramNode> _children = [];

  @override
  void add(ProgramNode node) => _children.add(node);

  @override
  void remove(ProgramNode node) => _children.remove(node);

  @override
  void traverse(CodeGenerator cg) {
    cg.visitStatement(this);
    for (var child in _children) {
      child.traverse(cg);
    }
  }
}

class ExpressionNode extends ProgramNode {
  final List<ProgramNode> _children = [];

  @override
  void add(ProgramNode node) => _children.add(node);

  @override
  void remove(ProgramNode node) => _children.remove(node);

  @override
  void traverse(CodeGenerator cg) {
    cg.visitExpression(this);
    for (var child in _children) {
      child.traverse(cg);
    }
  }
}

class ProgramNodeBuilder {
  ProgramNode? _node;

  ProgramNodeBuilder();

  ProgramNode newVariable(String variableName) {
    return ExpressionNode();
  }

  ProgramNode newAssignment(ProgramNode variable, ProgramNode expression) {
    var statement = StatementNode();
    statement.add(variable);
    statement.add(expression);
    _node = statement;
    return statement;
  }

  ProgramNode? getRootNode() {
    return _node;
  }
}

class Parser {
  void parse(Scanner scanner, ProgramNodeBuilder builder) {
    print("Parser: Parsing tokens...");

    Token t = scanner.scan();
    print("Parser: Scanned $t");

    var varNode = builder.newVariable("x");
    var exprNode = builder.newVariable("y");
    builder.newAssignment(varNode, exprNode);

    print("Parser: Parse tree built.");
  }
}

// The Visitor Pattern: CodeGenerator
// Abstract base class
abstract class BaseCodeGenerator implements CodeGenerator {
  final BytecodeStream output;
  BaseCodeGenerator(this.output);
}

// Concrete Visitor: RISCCodeGenerator
class RISCCodeGenerator extends BaseCodeGenerator {
  RISCCodeGenerator(BytecodeStream output) : super(output);

  @override
  void visitStatement(StatementNode node) {
    print("Generating RISC code for StatementNode");
    output.add(Bytecode("RISC_NOOP"));
  }

  @override
  void visitExpression(ExpressionNode node) {
    print("Generating RISC code for ExpressionNode");
    output.add(Bytecode("RISC_LOAD_REG"));
  }
}

// The Facade: Compiler
class Compiler {
  Compiler();

  void compile(InputStream input, BytecodeStream output) {
    // 1. Initialize Scanner
    var scanner = Scanner(input);

    // 2. Initialize Builder
    var builder = ProgramNodeBuilder();

    // 3. Initialize Parser and Parse
    var parser = Parser();
    parser.parse(scanner, builder);

    // 4. Initialize the specific Generator
    var generator = RISCCodeGenerator(output);

    // 5. Get the tree and Traverse to generate code
    ProgramNode? parseTree = builder.getRootNode();

    if (parseTree != null) {
      print("Compiler: Traversing tree to generate code...");
      parseTree.traverse(generator);
    } else {
      print("Compiler: Parsing failed, no tree generated.");
    }
  }
}

void main() {
  // The client doesn't need to know about Parser, Scanner, Builders, or Visitors.
  // It only interacts with the Compiler Facade.

  var sourceCode = InputStream("var x = y;");
  var bytecodeOutput = BytecodeStream();

  var compiler = Compiler();

  print("--- Client: Starting Compilation ---");
  compiler.compile(sourceCode, bytecodeOutput);
  print("--- Client: Compilation Finished ---");
}
// 1. Core Identity

      // Pattern Name: Facade
      // Category: Structural (Object)
      // Intent: Provide a unified interface to a set of interfaces in a subsystem.
      // Facade defines a higher-level interface that makes the subsystem easier to use.

// 2. The Problem & Solution (Motivation)

      // Scenario: A complex subsystem (e.g., a Compiler) consists of many specialized classes
      // (Scanner, Parser, BytecodeStream, etc.).
      // Problem: Clients often just want a simple result (compile X), but strict dependency
      // requires them to know and initialize all internal subsystem classes. This increases
      // coupling and complexity.
      // Solution: Create a Facade class (Compiler) that acts as a simple entry point.
      // It "glues" the internal classes together to perform common tasks.

// 3. Participants

      // Facade (Compiler):

            // - Knows which subsystem classes are responsible for a request.
            // - Delegates client requests to appropriate subsystem objects.

      // Subsystem Classes (Scanner, Parser, etc.):

            // - Implement the actual functionality.
            // - Handle work assigned by the Facade.
            // - CRITICAL: They have no knowledge of the Facade (no references back to it).

      // Client:

            // - Communicates only with the Facade.
            // - Does not need to access subsystem objects directly (though it can if necessary).

// 4. Consequences & Benefits

      // Decoupling: Promotes weak coupling between the subsystem and clients. You can vary
      // the internal subsystem components without breaking client code.
      // Layering: Helps layer a system. Subsystems can communicate with each other solely
      // through their Facades, eliminating circular dependencies.
      // Compilation Speed: reducing dependencies limits recompilation when small internal
      // parts of a subsystem change.
      // Flexibility: It does not prevent advanced applications from accessing the lower-level
      // subsystem classes if they really need to. It offers a "default view" without
      // hiding the power completely.

// 5. Implementation Considerations

      // Reducing Coupling: You can make the Facade an abstract class to completely hide
      // which implementation of a subsystem is being used.
      // Public vs. Private Interfaces: Ideally, the Facade is part of the "Public" interface,
      // while the complex logic remains "Private" to the subsystem (though language support
      // varies).
      // Singleton: Usually, only one Facade object is required, so Facades are often
      // implemented as Singletons.

// 6. Comparison with Related Patterns

      // Mediator: Abstracts communication between peer objects (colleagues) to centralize logic.
      // Peers know about the Mediator.
      // Facade: Abstracts the interface to a subsystem to simplify use. Subsystem classes
      // do not know about the Facade.
      // Abstract Factory: Can be used with Facade to create subsystem objects in a
      // platform-independent way.

// 7. Sample Code Use Case & Analysis

      // Scenario: A Compiler Subsystem.

      // The task of compiling code involves a complex orchestration of several design patterns:

            // - Builder Pattern (to construct the parse tree).
            // - Composite Pattern (the structure of the parse tree nodes).
            // - Visitor Pattern (the CodeGenerator traversing the tree).

// Analysis of the Facade Role:

      // Complexity Abstraction (The "Why"):
      // Without the Facade, the Client would need to write ~10 lines of setup code:
      // creating the input stream, initializing the scanner, initializing the builder,
      // creating the parser, calling parse, initializing the generator, and handling the traversal.

      // The "Glue" Logic (The "How"):

            // The Facade (Compiler) encapsulates this specific workflow.
            // 1. It owns the knowledge of the *order of operations* (Scan -> Parse -> Generate).
            // 2. It manages the *lifecycle* of the temporary objects (Scanner, Builder).
            // 3. It provides a default configuration (e.g., hard-coding RISCCodeGenerator).

// Operational Requirement:

      // For the Facade to work, it must have access to the *interfaces* of the subsystem classes,
      // but the subsystem classes must remain ignorant of the Facade. This allows the
      // subsystem to be tested or reused independently of the "Compiler" wrapper.
