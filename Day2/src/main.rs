use std::fs;
fn main() {
    day1part1();
    day1part2();
}

fn day1part1() {
    let mut sum_of_repeated = 0;
    let file_path = "./day2input.txt";
    let file = fs::read_to_string(file_path).expect("Should be able to read ./day2input.txt");
    let ranges = file.split(",");
    let repetitions = 2;
    for range in ranges {
		let parts = range.split("-").collect::<Vec<&str>>();
        let first = parts[0].trim();
        let last = parts[1].trim();
        let start = first.parse::<i64>().unwrap();
        let end = last.parse::<i64>().unwrap();
        for i in start..(end+1) {
            let string_i = i.to_string();
            let length = string_i.chars().count();
            if length % repetitions == 0 {
                let half = length / repetitions;
                let first_half = &string_i[..half];
                let second_half = &string_i[half..];
                if first_half == second_half {
                    sum_of_repeated = sum_of_repeated + i;
                }
            }
        }
	}
    println!("(part 1) Sum of invalid IDs: {sum_of_repeated}")
}

fn day1part2() {
    let mut sum_of_repeated = 0;
    let file_path = "./day2input.txt";
    let file = fs::read_to_string(file_path).expect("Should be able to read ./day2input.txt");
    let ranges = file.split(",");
    for range in ranges {
		let parts = range.split("-").collect::<Vec<&str>>();
        let first = parts[0].trim();
        let last = parts[1].trim();
        let start = first.parse::<i64>().unwrap();
        let end = last.parse::<i64>().unwrap();
        for i in start..(end+1) {
            let string_i = i.to_string();
            let length = string_i.chars().count();
            for repetitions in 2..(length+1) {
                if length % repetitions == 0 {
                    let mut parts = Vec::new();
                    let part_length = length/repetitions;
                    for j in 0..repetitions {
                        let part = string_i[j*part_length..(j+1)*part_length].to_string();
                        parts.push(part.to_string());
                    }
                    let first = parts[0].clone();
                    let all_equal = parts.iter().all(|part| *part == first);
                    if all_equal {
                        sum_of_repeated = sum_of_repeated + i;
                        break;
                    }
                }
            }
        }
	}
    println!("(part 2) Sum of invalid IDs: {sum_of_repeated}")
}
