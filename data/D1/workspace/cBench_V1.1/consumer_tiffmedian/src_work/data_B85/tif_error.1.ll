; ModuleID = 'tif_error.ll'
source_filename = "tif_error.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@_TIFFerrorHandler = external local_unnamed_addr global void (i8*, i8*, %struct.__va_list_tag*)*, align 8

; Function Attrs: noinline norecurse nounwind uwtable
define void (i8*, i8*, %struct.__va_list_tag*)* @TIFFSetErrorHandler(void (i8*, i8*, %struct.__va_list_tag*)*) local_unnamed_addr #0 {
  %2 = load void (i8*, i8*, %struct.__va_list_tag*)*, void (i8*, i8*, %struct.__va_list_tag*)** @_TIFFerrorHandler, align 8
  store void (i8*, i8*, %struct.__va_list_tag*)* %0, void (i8*, i8*, %struct.__va_list_tag*)** @_TIFFerrorHandler, align 8
  ret void (i8*, i8*, %struct.__va_list_tag*)* %2
}

; Function Attrs: noinline nounwind uwtable
define void @TIFFError(i8*, i8*, ...) local_unnamed_addr #1 {
  %3 = alloca [1 x %struct.__va_list_tag], align 16
  %4 = load void (i8*, i8*, %struct.__va_list_tag*)*, void (i8*, i8*, %struct.__va_list_tag*)** @_TIFFerrorHandler, align 8
  %5 = icmp eq void (i8*, i8*, %struct.__va_list_tag*)* %4, null
  br i1 %5, label %10, label %6

; <label>:6:                                      ; preds = %2
  %7 = bitcast [1 x %struct.__va_list_tag]* %3 to i8*
  call void @llvm.va_start(i8* nonnull %7)
  %8 = load void (i8*, i8*, %struct.__va_list_tag*)*, void (i8*, i8*, %struct.__va_list_tag*)** @_TIFFerrorHandler, align 8
  %9 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %3, i64 0, i64 0
  call void %8(i8* %0, i8* %1, %struct.__va_list_tag* nonnull %9) #2
  call void @llvm.va_end(i8* nonnull %7)
  br label %10

; <label>:10:                                     ; preds = %2, %6
  ret void
}

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #2

; Function Attrs: nounwind
declare void @llvm.va_end(i8*) #2

attributes #0 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
