mutable struct Neuron
    input_weight_pair::Tuple{Float64,Float64}  # input neurons have weight = 1
    activation::Function
    result::Float64
end

mutable struct Layer
    neurons::Array{Neuron,1}
end

mutable struct NeuralNetwork
    structure::Array{Int64,1}
    layers::Array{Layer,1}
end

function relu(x)
    return max(0.0, x)
end

function constant(x)
    return x
end

function initNeuron(activation::Function, input=0.0, weight=1.0)
    neuron = Neuron((input, weight), activation, 0)
    return neuron
end

function initNetwork(structure::Array{Int64,1})

    layers = []
    nn = NeuralNetwork(structure, layers)

    input_layer = Layer(map(_ -> initNeuron(constant, 0, 1), 1:structure[1]))  # make this real inputs
    push!(layers, input_layer)

    hidden_layer = Layer(map(_ -> initNeuron(relu, 0, 1), 1:structure[2]))
    push!(layers, hidden_layer)

    output_layer = Layer(map(_ -> initNeuron(relu, 0, 1), 1:structure[3]))
    push!(layers, output_layer)

    nn.layers = layers

    return nn
end


function neuron_ff(input::Number, weight::Number)
    return input * weight
end

function layer_ff(inputs::Array, weights::Array)
    return reduce(+, map(neuron_ff, inputs, weights))
end






nn = initNetwork([2, 3, 1])
nn.layers[1]

layer_ff([1.0,2.0], [1.0,2.0])

layer_ff([1.0,2.0], [1.0,2.0])

println(s)


#s = map(tuto funkci, aplikuj na vsechny tyto prvky)

