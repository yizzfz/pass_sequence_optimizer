; ModuleID = 'bitfiles.ll'
source_filename = "bitfiles.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.bfile = type { %struct._IO_FILE*, i8, i8, i8, i8 }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

; Function Attrs: noinline nounwind uwtable
define noalias %struct.bfile* @bfopen(i8* nocapture readonly, i8* nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call noalias i8* @malloc(i64 16) #2
  %4 = bitcast i8* %3 to %struct.bfile*
  %5 = icmp eq i8* %3, null
  br i1 %5, label %14, label %6

; <label>:6:                                      ; preds = %2
  %7 = tail call %struct._IO_FILE* @fopen(i8* %0, i8* %1)
  %8 = bitcast i8* %3 to %struct._IO_FILE**
  store %struct._IO_FILE* %7, %struct._IO_FILE** %8, align 8
  %9 = icmp eq %struct._IO_FILE* %7, null
  br i1 %9, label %10, label %11

; <label>:10:                                     ; preds = %6
  tail call void @free(i8* nonnull %3) #2
  br label %14

; <label>:11:                                     ; preds = %6
  %12 = getelementptr inbounds i8, i8* %3, i64 9
  store i8 0, i8* %12, align 1
  %13 = getelementptr inbounds i8, i8* %3, i64 11
  store i8 0, i8* %13, align 1
  br label %14

; <label>:14:                                     ; preds = %2, %11, %10
  %.0 = phi %struct.bfile* [ null, %10 ], [ %4, %11 ], [ null, %2 ]
  ret %struct.bfile* %.0
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) local_unnamed_addr #1

; Function Attrs: nounwind
declare noalias %struct._IO_FILE* @fopen(i8* nocapture readonly, i8* nocapture readonly) local_unnamed_addr #1

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define i32 @bfread(%struct.bfile* nocapture) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.bfile, %struct.bfile* %0, i64 0, i32 2
  %3 = load i8, i8* %2, align 1
  %4 = icmp eq i8 %3, 0
  br i1 %4, label %5, label %11

; <label>:5:                                      ; preds = %1
  %6 = getelementptr inbounds %struct.bfile, %struct.bfile* %0, i64 0, i32 0
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %8 = tail call i32 @fgetc(%struct._IO_FILE* %7)
  %9 = trunc i32 %8 to i8
  %10 = getelementptr inbounds %struct.bfile, %struct.bfile* %0, i64 0, i32 1
  store i8 %9, i8* %10, align 8
  store i8 8, i8* %2, align 1
  br label %11

; <label>:11:                                     ; preds = %5, %1
  %12 = load i8, i8* %2, align 1
  %13 = add i8 %12, -1
  store i8 %13, i8* %2, align 1
  %14 = getelementptr inbounds %struct.bfile, %struct.bfile* %0, i64 0, i32 1
  %15 = load i8, i8* %14, align 8
  %16 = sext i8 %15 to i32
  %17 = sext i8 %13 to i32
  %18 = shl i32 1, %17
  %19 = and i32 %16, %18
  %20 = icmp ne i32 %19, 0
  %21 = zext i1 %20 to i32
  ret i32 %21
}

; Function Attrs: nounwind
declare i32 @fgetc(%struct._IO_FILE* nocapture) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define void @bfwrite(i32, %struct.bfile* nocapture) local_unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.bfile, %struct.bfile* %1, i64 0, i32 4
  %4 = load i8, i8* %3, align 1
  %5 = icmp eq i8 %4, 8
  br i1 %5, label %6, label %13

; <label>:6:                                      ; preds = %2
  %7 = getelementptr inbounds %struct.bfile, %struct.bfile* %1, i64 0, i32 3
  %8 = load i8, i8* %7, align 2
  %9 = sext i8 %8 to i32
  %10 = getelementptr inbounds %struct.bfile, %struct.bfile* %1, i64 0, i32 0
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** %10, align 8
  %12 = tail call i32 @fputc(i32 %9, %struct._IO_FILE* %11)
  store i8 0, i8* %3, align 1
  br label %13

; <label>:13:                                     ; preds = %6, %2
  %14 = load i8, i8* %3, align 1
  %15 = add i8 %14, 1
  store i8 %15, i8* %3, align 1
  %16 = getelementptr inbounds %struct.bfile, %struct.bfile* %1, i64 0, i32 3
  %17 = load i8, i8* %16, align 2
  %18 = shl i8 %17, 1
  %19 = and i32 %0, 1
  %20 = zext i8 %18 to i32
  %21 = or i32 %20, %19
  %22 = trunc i32 %21 to i8
  store i8 %22, i8* %16, align 2
  ret void
}

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define void @bfclose(%struct.bfile* nocapture) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.bfile, %struct.bfile* %0, i64 0, i32 0
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** %2, align 8
  %4 = tail call i32 @fclose(%struct._IO_FILE* %3)
  %5 = bitcast %struct.bfile* %0 to i8*
  tail call void @free(i8* %5) #2
  ret void
}

; Function Attrs: nounwind
declare i32 @fclose(%struct._IO_FILE* nocapture) local_unnamed_addr #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
