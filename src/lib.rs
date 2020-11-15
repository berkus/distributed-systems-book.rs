pub fn hello_text() -> &'static str {
    "Hello Rust"
}

#[cfg(test)]
mod tests {
    #[test]
    fn it_works() {
        assert_eq!(2 + 2, 4);
    }
}
