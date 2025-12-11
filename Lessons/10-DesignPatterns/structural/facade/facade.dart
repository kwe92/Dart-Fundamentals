// TODO: Add notes

// --------------------------------------------------------------------------
// 1. Underlying Subsystem Classes (Data Structures)
// --------------------------------------------------------------------------

// Represents a token in the programming language.
class Token {
  final String _type;
  Token(this._type);
  
  @override
  String toString() => "Token($_type)";
}

// Represents a single machine instruction.
class Bytecode {
  final String _instruction;
  Bytecode(this._instruction);
  
  @override
  String toString() => _instruction;
}

// Mimics the C++ BytecodeStream
class BytecodeStream {
  final List<Bytecode> _buffer = [];

  void add(Bytecode code) {
    _buffer.add(code);
    print("Stream received bytecode: $code");
  }
}

// Abstract Input Stream wrapper (to mimic istream&)
class InputStream {
  final String _data;
  InputStream(this._data);
  // Implementation details omitted...
}

// --------------------------------------------------------------------------
// 2. Subsystem Classes (Scanner, Nodes, Builder, Parser, Generator)
// --------------------------------------------------------------------------

// The Scanner takes a stream of characters and produces tokens.
class Scanner {
  final InputStream _inputStream;

  Scanner(this._inputStream);

  Token scan() {
    // Logic to read input and return next token...
    return Token("VAR_DEF"); 
  }
}

// Forward declaration for the Visitor pattern
abstract class CodeGenerator {
  void visitStatement(StatementNode node);
  void visitExpression(ExpressionNode node);
}

// The Composite Pattern: ProgramNode hierarchy
abstract class ProgramNode {
  // Child manipulation
  void add(ProgramNode node);
  void remove(ProgramNode node);
  
  // The 'Traverse' operation acts as the 'accept' method in Visitor pattern
  void traverse(CodeGenerator cg);
}

// Concrete Node: Statement
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

// Concrete Node: Expression
class ExpressionNode extends ProgramNode {
  final List<ProgramNode> _children = [];

  @override
  void add(ProgramNode node) => _children.add(node);

  @override
  void remove(ProgramNode node) => _children.remove(node);

  @override
  void traverse(CodeGenerator cg) {
    // The C++ example explicitly showed this logic:
    cg.visitExpression(this);
    for (var child in _children) {
      child.traverse(cg);
    }
  }
}

// The Builder Pattern: Constructs the Parse Tree
class ProgramNodeBuilder {
  ProgramNode? _node;

  ProgramNodeBuilder();

  ProgramNode newVariable(String variableName) {
    // Logic to create variable node...
    return ExpressionNode(); 
  }

  ProgramNode newAssignment(ProgramNode variable, ProgramNode expression) {
    // Logic to create assignment node...
    var statement = StatementNode();
    statement.add(variable);
    statement.add(expression);
    _node = statement; // Assuming this is the root for this simple example
    return statement;
  }
  
  // Returns the result of the build process
  ProgramNode? getRootNode() {
    return _node;
  }
}

// The Parser: Uses Scanner and Builder to parse source code.
class Parser {
  void parse(Scanner scanner, ProgramNodeBuilder builder) {
    print("Parser: Parsing tokens...");
    
    // Simulating parsing logic:
    // 1. Scan tokens
    // 2. Call builder methods
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

// --------------------------------------------------------------------------
// 3. The Facade
// --------------------------------------------------------------------------

class Compiler {
  Compiler();

  // The Facade method that simplifies the complex interactions above
  void compile(InputStream input, BytecodeStream output) {
    // 1. Initialize Scanner
    var scanner = Scanner(input);
    
    // 2. Initialize Builder
    var builder = ProgramNodeBuilder();
    
    // 3. Initialize Parser and Parse
    var parser = Parser();
    parser.parse(scanner, builder);
    
    // 4. Initialize the specific Generator (Hard-coded as per the example)
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

// --------------------------------------------------------------------------
// 4. Client Code
// --------------------------------------------------------------------------

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