; ModuleID = 'toast_lin.ll'
source_filename = "toast_lin.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@in = external global %struct._IO_FILE*, align 8
@out = external global %struct._IO_FILE*, align 8

; Function Attrs: nounwind uwtable
define i32 @linear_input(i16*) #0 {
  %2 = alloca i16*, align 8
  store i16* %0, i16** %2, align 8
  %3 = load i16*, i16** %2, align 8
  %4 = bitcast i16* %3 to i8*
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @in, align 8
  %6 = call i64 @fread(i8* %4, i64 2, i64 160, %struct._IO_FILE* %5)
  %7 = trunc i64 %6 to i32
  ret i32 %7
}

declare i64 @fread(i8*, i64, i64, %struct._IO_FILE*) #1

; Function Attrs: nounwind uwtable
define i32 @linear_output(i16*) #0 {
  %2 = alloca i16*, align 8
  store i16* %0, i16** %2, align 8
  %3 = load i16*, i16** %2, align 8
  %4 = bitcast i16* %3 to i8*
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @out, align 8
  %6 = call i64 @fwrite(i8* %4, i64 2, i64 160, %struct._IO_FILE* %5)
  %7 = icmp ne i64 %6, 160
  %8 = zext i1 %7 to i32
  %9 = sub nsw i32 0, %8
  ret i32 %9
}

declare i64 @fwrite(i8*, i64, i64, %struct._IO_FILE*) #1

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
