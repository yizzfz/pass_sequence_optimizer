; ModuleID = 'jmemansi.ll'
source_filename = "jmemansi.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.jpeg_common_struct = type { %struct.jpeg_error_mgr*, %struct.jpeg_memory_mgr*, %struct.jpeg_progress_mgr*, i32, i32 }
%struct.jpeg_error_mgr = type { void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*, i8*)*, void (%struct.jpeg_common_struct*)*, i32, %union.anon, i32, i64, i8**, i32, i8**, i32, i32 }
%union.anon = type { [8 x i32], [48 x i8] }
%struct.jpeg_memory_mgr = type { i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)*, i8** (%struct.jpeg_common_struct*, i32, i32, i32)*, [64 x i16]** (%struct.jpeg_common_struct*, i32, i32, i32)*, %struct.jvirt_sarray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)*, %struct.jvirt_barray_control* (%struct.jpeg_common_struct*, i32, i32, i32, i32, i32)*, void (%struct.jpeg_common_struct*)*, i8** (%struct.jpeg_common_struct*, %struct.jvirt_sarray_control*, i32, i32, i32)*, [64 x i16]** (%struct.jpeg_common_struct*, %struct.jvirt_barray_control*, i32, i32, i32)*, void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*)*, i64 }
%struct.jvirt_sarray_control = type opaque
%struct.jvirt_barray_control = type opaque
%struct.jpeg_progress_mgr = type { void (%struct.jpeg_common_struct*)*, i64, i64, i32, i32 }
%struct.backing_store_struct = type { void (%struct.jpeg_common_struct*, %struct.backing_store_struct*, i8*, i64, i64)*, void (%struct.jpeg_common_struct*, %struct.backing_store_struct*, i8*, i64, i64)*, void (%struct.jpeg_common_struct*, %struct.backing_store_struct*)*, %struct._IO_FILE*, [64 x i8] }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1

; Function Attrs: noinline nounwind uwtable
define noalias i8* @jpeg_get_small(%struct.jpeg_common_struct* nocapture readnone, i64) #0 {
  %3 = tail call noalias i8* @malloc(i64 %1) #5
  ret i8* %3
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: noinline nounwind uwtable
define void @jpeg_free_small(%struct.jpeg_common_struct* nocapture readnone, i8* nocapture, i64) #0 {
  tail call void @free(i8* %1) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #1

; Function Attrs: noinline nounwind uwtable
define noalias i8* @jpeg_get_large(%struct.jpeg_common_struct* nocapture readnone, i64) #0 {
  %3 = tail call noalias i8* @malloc(i64 %1) #5
  ret i8* %3
}

; Function Attrs: noinline nounwind uwtable
define void @jpeg_free_large(%struct.jpeg_common_struct* nocapture readnone, i8* nocapture, i64) #0 {
  tail call void @free(i8* %1) #5
  ret void
}

; Function Attrs: noinline norecurse nounwind readonly uwtable
define i64 @jpeg_mem_available(%struct.jpeg_common_struct* nocapture readonly, i64, i64, i64) #2 {
  %5 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %0, i64 0, i32 1
  %6 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %5, align 8
  %7 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %6, i64 0, i32 11
  %8 = load i64, i64* %7, align 8
  %9 = sub nsw i64 %8, %3
  ret i64 %9
}

; Function Attrs: noinline nounwind uwtable
define void @jpeg_open_backing_store(%struct.jpeg_common_struct*, %struct.backing_store_struct* nocapture, i64) #0 {
  %4 = tail call %struct._IO_FILE* @tmpfile()
  %5 = getelementptr inbounds %struct.backing_store_struct, %struct.backing_store_struct* %1, i64 0, i32 3
  store %struct._IO_FILE* %4, %struct._IO_FILE** %5, align 8
  %6 = icmp eq %struct._IO_FILE* %4, null
  br i1 %6, label %7, label %17

; <label>:7:                                      ; preds = %3
  %8 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %0, i64 0, i32 0
  %9 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %8, align 8
  %10 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %9, i64 0, i32 5
  store i32 62, i32* %10, align 8
  %11 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %8, align 8
  %12 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %11, i64 0, i32 6
  %13 = bitcast %union.anon* %12 to i8*
  tail call void @llvm.memset.p0i8.i64(i8* %13, i8 0, i64 80, i32 1, i1 false)
  %14 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %8, align 8
  %15 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %14, i64 0, i32 0
  %16 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %15, align 8
  tail call void %16(%struct.jpeg_common_struct* %0) #5
  br label %17

; <label>:17:                                     ; preds = %7, %3
  %18 = getelementptr inbounds %struct.backing_store_struct, %struct.backing_store_struct* %1, i64 0, i32 0
  store void (%struct.jpeg_common_struct*, %struct.backing_store_struct*, i8*, i64, i64)* @read_backing_store, void (%struct.jpeg_common_struct*, %struct.backing_store_struct*, i8*, i64, i64)** %18, align 8
  %19 = getelementptr inbounds %struct.backing_store_struct, %struct.backing_store_struct* %1, i64 0, i32 1
  store void (%struct.jpeg_common_struct*, %struct.backing_store_struct*, i8*, i64, i64)* @write_backing_store, void (%struct.jpeg_common_struct*, %struct.backing_store_struct*, i8*, i64, i64)** %19, align 8
  %20 = getelementptr inbounds %struct.backing_store_struct, %struct.backing_store_struct* %1, i64 0, i32 2
  store void (%struct.jpeg_common_struct*, %struct.backing_store_struct*)* @close_backing_store, void (%struct.jpeg_common_struct*, %struct.backing_store_struct*)** %20, align 8
  ret void
}

; Function Attrs: nounwind
declare noalias %struct._IO_FILE* @tmpfile() #1

; Function Attrs: noinline nounwind uwtable
define internal void @read_backing_store(%struct.jpeg_common_struct*, %struct.backing_store_struct* nocapture readonly, i8* nocapture, i64, i64) #0 {
  %6 = getelementptr inbounds %struct.backing_store_struct, %struct.backing_store_struct* %1, i64 0, i32 3
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %8 = tail call i32 @fseek(%struct._IO_FILE* %7, i64 %3, i32 0)
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %17, label %10

; <label>:10:                                     ; preds = %5
  %11 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %0, i64 0, i32 0
  %12 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %11, align 8
  %13 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %12, i64 0, i32 5
  store i32 64, i32* %13, align 8
  %14 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %11, align 8
  %15 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %14, i64 0, i32 0
  %16 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %15, align 8
  tail call void %16(%struct.jpeg_common_struct* %0) #5
  br label %17

; <label>:17:                                     ; preds = %5, %10
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %19 = tail call i64 @fread(i8* %2, i64 1, i64 %4, %struct._IO_FILE* %18)
  %20 = icmp eq i64 %19, %4
  br i1 %20, label %28, label %21

; <label>:21:                                     ; preds = %17
  %22 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %0, i64 0, i32 0
  %23 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %22, align 8
  %24 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %23, i64 0, i32 5
  store i32 63, i32* %24, align 8
  %25 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %22, align 8
  %26 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %25, i64 0, i32 0
  %27 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %26, align 8
  tail call void %27(%struct.jpeg_common_struct* %0) #5
  br label %28

; <label>:28:                                     ; preds = %17, %21
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @write_backing_store(%struct.jpeg_common_struct*, %struct.backing_store_struct* nocapture readonly, i8* nocapture, i64, i64) #0 {
  %6 = getelementptr inbounds %struct.backing_store_struct, %struct.backing_store_struct* %1, i64 0, i32 3
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %8 = tail call i32 @fseek(%struct._IO_FILE* %7, i64 %3, i32 0)
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %17, label %10

; <label>:10:                                     ; preds = %5
  %11 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %0, i64 0, i32 0
  %12 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %11, align 8
  %13 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %12, i64 0, i32 5
  store i32 64, i32* %13, align 8
  %14 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %11, align 8
  %15 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %14, i64 0, i32 0
  %16 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %15, align 8
  tail call void %16(%struct.jpeg_common_struct* %0) #5
  br label %17

; <label>:17:                                     ; preds = %5, %10
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %19 = tail call i64 @fwrite(i8* %2, i64 1, i64 %4, %struct._IO_FILE* %18)
  %20 = icmp eq i64 %19, %4
  br i1 %20, label %28, label %21

; <label>:21:                                     ; preds = %17
  %22 = getelementptr inbounds %struct.jpeg_common_struct, %struct.jpeg_common_struct* %0, i64 0, i32 0
  %23 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %22, align 8
  %24 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %23, i64 0, i32 5
  store i32 65, i32* %24, align 8
  %25 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %22, align 8
  %26 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %25, i64 0, i32 0
  %27 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %26, align 8
  tail call void %27(%struct.jpeg_common_struct* %0) #5
  br label %28

; <label>:28:                                     ; preds = %17, %21
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @close_backing_store(%struct.jpeg_common_struct* nocapture readnone, %struct.backing_store_struct* nocapture readonly) #0 {
  %3 = getelementptr inbounds %struct.backing_store_struct, %struct.backing_store_struct* %1, i64 0, i32 3
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %5 = tail call i32 @fclose(%struct._IO_FILE* %4)
  ret void
}

; Function Attrs: noinline norecurse nounwind readnone uwtable
define i64 @jpeg_mem_init(%struct.jpeg_common_struct* nocapture readnone) #3 {
  ret i64 1000000
}

; Function Attrs: noinline norecurse nounwind readnone uwtable
define void @jpeg_mem_term(%struct.jpeg_common_struct* nocapture) #3 {
  ret void
}

; Function Attrs: nounwind
declare i32 @fseek(%struct._IO_FILE* nocapture, i64, i32) #1

; Function Attrs: nounwind
declare i64 @fread(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #1

; Function Attrs: nounwind
declare i32 @fclose(%struct._IO_FILE* nocapture) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind readonly uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noinline norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind }
attributes #5 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
