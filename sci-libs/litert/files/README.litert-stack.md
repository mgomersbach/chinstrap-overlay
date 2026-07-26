# LiteRT + Edge TPU stack

This is a small meta package that pulls in:

- `sci-libs/libedgetpu` (Edge TPU runtime/delegate library)
- `dev-python/ai-edge-litert` (LiteRT Python interpreter package)

## Minimal Python usage

```python
from ai_edge_litert.interpreter import Interpreter, load_delegate

delegate = load_delegate("libedgetpu.so.1", {"device": "pci:0"})
interpreter = Interpreter(
    model_path="model_edgetpu.tflite",
    experimental_delegates=[delegate],
)

interpreter.allocate_tensors()
# fill input tensor(s), invoke, read output tensor(s)
```

`device` can be:
- `"pci"`, `"pci:0"`, `"pci:1"`, ...
- `"usb"`, `"usb:0"`, ...
- `":0"` (index in global Edge TPU enumeration)
