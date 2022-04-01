mutable struct Neuron
    input_weight_pair::Tuple{Float64,Float64}  # input neurons have weight = 1
    activation::Function
    result::Float64
end

mutable struct NeuralNetwork
    structure::Array{Int64,1}
    layers::Array{Layer,1}   # array of layers
end


mutable struct Layer
    neurons::Array{Neuron,1}
end

function relu(x)
    return max(0.0, x)
end

function constant(x)
    return x
end

function initNeuron(activation::Function, input = 0.0, weight = 1.0)
    neuron = Neuron((input, weight), activation, 0)
    return neuron
end

function initNetwork(structure::Array{Int64,1})

    # layers = []
    # for num in structure
    #     neuron = initNeuron(relu)
    #     arr = map(_ -> neuron, 1:num)
    #     push!(layers, arr)
    # end


    # TODO:
    # input layer
    layer = map(initNeuron(constant, 0, 1), structure[1])
    # hidden layer
    layer = map(initNeuron(relu, 0, 1), structure[2])
    # output layer
    layer = map(initNeuron(relu, 0, 1), structure[3])
    
    nn = NeuralNetwork(structure, layers)

    return nn
end


function feedforward(neuron::Neuron)
    return neuron.activation(reduce(*, neuron.input_weight_pair))
end

net.layers

x = map(feedforward, net.layers[1])

#s = map(tuto funkci, aplikuj na vsechny tyto prvky)

la = Layer([initNeuron(relu),initNeuron(relu)])