#[derive(Drop,Serde)]
struct StarknetOsOutput{
    initial_root: felt252,
    final_root: felt252,
    prev_block_number: felt252,
    new_block_number: felt252,
    prev_block_hash: felt252,
    new_block_hash: felt252,
    os_program_hash: felt252,
    starknet_os_config_hash: felt252,
    use_kzg_da: felt252,
    full_output: felt252,
    messages_to_l1: Array<felt252>,
    messages_to_l2: Array<felt252>,
    contracts: Array<ContractChanges>,
    classes: Array<(felt252, felt252)>,
}
#[derive(Drop,Serde)]
struct ContractChanges {
     addr: felt252,
     nonce: felt252,
     class_hash: felt252,
     storage_changes: Array<(felt252, felt252)>,
}

fn main(input: Array<felt252>) -> Array<felt252> {
    let mut input = input.span(); 
    let starknet_os_output = Serde::<StarknetOsOutput>::deserialize(ref input).unwrap();
    let mut output = array![];
    starknet_os_output.serialize(ref output);
    output
}
