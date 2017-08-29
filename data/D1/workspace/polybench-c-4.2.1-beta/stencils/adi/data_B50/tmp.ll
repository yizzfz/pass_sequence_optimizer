; ModuleID = 'A.ll'
source_filename = "adi.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"u\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %4 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %5 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %6 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %7 = bitcast i8* %3 to [1000 x double]*
  tail call fastcc void @init_array([1000 x double]* %7)
  tail call void (...) @polybench_timer_start() #3
  %8 = bitcast i8* %4 to [1000 x double]*
  %9 = bitcast i8* %5 to [1000 x double]*
  %10 = bitcast i8* %6 to [1000 x double]*
  tail call fastcc void @kernel_adi([1000 x double]* %7, [1000 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  tail call fastcc void @print_array([1000 x double]* %7)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  tail call void @free(i8* %3) #3
  tail call void @free(i8* %4) #3
  tail call void @free(i8* %5) #3
  tail call void @free(i8* %6) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([1000 x double]*) unnamed_addr #0 {
.preheader.lr.ph:
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv15 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next16, %._crit_edge.us ]
  %1 = add nuw nsw i64 %indvars.iv15, 1000
  %2 = trunc i64 %1 to i32
  br label %3

; <label>:3:                                      ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge ], [ 0, %.preheader.us ]
  %4 = trunc i64 %indvars.iv to i32
  %5 = sub i32 %2, %4
  %6 = sitofp i32 %5 to double
  %7 = fdiv double %6, 1.000000e+03
  %8 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv15, i64 %indvars.iv
  store double %7, double* %8, align 8
  %exitcond = icmp eq i64 %indvars.iv, 999
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge

._crit_edge:                                      ; preds = %3
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %3

._crit_edge.us:                                   ; preds = %3
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next16, 1000
  br i1 %exitcond17, label %._crit_edge14, label %.preheader.us

._crit_edge14:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_adi([1000 x double]*, [1000 x double]*, [1000 x double]*, [1000 x double]*) unnamed_addr #0 {
.preheader152.lr.ph:
  br label %.preheader152

.preheader152:                                    ; preds = %._crit_edge170..preheader152_crit_edge, %.preheader152.lr.ph
  %.0171 = phi i32 [ 1, %.preheader152.lr.ph ], [ %93, %._crit_edge170..preheader152_crit_edge ]
  br label %.lr.ph159.split.us

.lr.ph159.split.us:                               ; preds = %._crit_edge157.us, %.preheader152
  %indvars.iv176 = phi i64 [ 1, %.preheader152 ], [ %indvars.iv.next177, %._crit_edge157.us ]
  %4 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 0, i64 %indvars.iv176
  store double 1.000000e+00, double* %4, align 8
  %5 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv176, i64 0
  store double 0.000000e+00, double* %5, align 8
  %6 = bitcast double* %4 to i64*
  %7 = load i64, i64* %6, align 8
  %8 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv176
  %9 = bitcast [1000 x double]* %8 to i64*
  store i64 %7, i64* %9, align 8
  %10 = add nsw i64 %indvars.iv176, -1
  %indvars.iv.next177 = add nuw nsw i64 %indvars.iv176, 1
  br label %20

._crit_edge157.us:                                ; preds = %.lr.ph156.us
  %exitcond186 = icmp eq i64 %indvars.iv.next177, 999
  br i1 %exitcond186, label %.lr.ph162.us.preheader, label %.lr.ph159.split.us

.lr.ph162.us.preheader:                           ; preds = %._crit_edge157.us
  br label %.lr.ph162.us

.lr.ph156.us:                                     ; preds = %.lr.ph156.us..lr.ph156.us_crit_edge, %._crit_edge.us
  %indvars.iv174 = phi i64 [ %indvars.iv.next175, %.lr.ph156.us..lr.ph156.us_crit_edge ], [ 998, %._crit_edge.us ]
  %11 = phi double [ %17, %.lr.ph156.us..lr.ph156.us_crit_edge ], [ 1.000000e+00, %._crit_edge.us ]
  %12 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv176, i64 %indvars.iv174
  %13 = load double, double* %12, align 8
  %14 = fmul double %13, %11
  %15 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv176, i64 %indvars.iv174
  %16 = load double, double* %15, align 8
  %17 = fadd double %14, %16
  %18 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv174, i64 %indvars.iv176
  store double %17, double* %18, align 8
  %19 = icmp sgt i64 %indvars.iv174, 1
  br i1 %19, label %.lr.ph156.us..lr.ph156.us_crit_edge, label %._crit_edge157.us

.lr.ph156.us..lr.ph156.us_crit_edge:              ; preds = %.lr.ph156.us
  %indvars.iv.next175 = add nsw i64 %indvars.iv174, -1
  br label %.lr.ph156.us

; <label>:20:                                     ; preds = %._crit_edge, %.lr.ph159.split.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge ], [ 1, %.lr.ph159.split.us ]
  %21 = add nsw i64 %indvars.iv, -1
  %22 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv176, i64 %21
  %23 = load double, double* %22, align 8
  %24 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv176, i64 %indvars.iv
  %25 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv, i64 %10
  %26 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv, i64 %indvars.iv.next177
  %27 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv176, i64 %21
  %.rhs = fmul double %23, 0xC09F400000000001
  %28 = fadd double %.rhs, 0x40AF420000000001
  %29 = fdiv double 0x409F400000000001, %28
  store double %29, double* %24, align 8
  %30 = bitcast double* %25 to <2 x double>*
  %31 = load <2 x double>, <2 x double>* %30, align 8
  %32 = fmul <2 x double> %31, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %33 = extractelement <2 x double> %32, i32 0
  %34 = extractelement <2 x double> %32, i32 1
  %35 = fsub double %34, %33
  %36 = load double, double* %26, align 8
  %37 = fmul double %36, 0xC08F400000000001
  %38 = fsub double %35, %37
  %39 = load double, double* %27, align 8
  %40 = fmul double %39, 0xC09F400000000001
  %41 = fsub double %38, %40
  %42 = fdiv double %41, %28
  %43 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv176, i64 %indvars.iv
  store double %42, double* %43, align 8
  %exitcond = icmp eq i64 %indvars.iv, 998
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge

._crit_edge:                                      ; preds = %20
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %20

._crit_edge.us:                                   ; preds = %20
  %44 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 999, i64 %indvars.iv176
  store double 1.000000e+00, double* %44, align 8
  br label %.lr.ph156.us

.lr.ph162.us:                                     ; preds = %.lr.ph162.us.preheader, %._crit_edge167.us
  %indvars.iv184 = phi i64 [ %indvars.iv.next185, %._crit_edge167.us ], [ 1, %.lr.ph162.us.preheader ]
  %45 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv184
  %46 = getelementptr inbounds [1000 x double], [1000 x double]* %45, i64 0, i64 0
  store double 1.000000e+00, double* %46, align 8
  %47 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv184, i64 0
  store double 0.000000e+00, double* %47, align 8
  %48 = bitcast [1000 x double]* %45 to i64*
  %49 = load i64, i64* %48, align 8
  %50 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv184
  %51 = bitcast [1000 x double]* %50 to i64*
  store i64 %49, i64* %51, align 8
  %52 = add nsw i64 %indvars.iv184, -1
  %indvars.iv.next185 = add nuw nsw i64 %indvars.iv184, 1
  br label %62

._crit_edge167.us:                                ; preds = %.lr.ph166.us
  %exitcond187 = icmp eq i64 %indvars.iv.next185, 999
  br i1 %exitcond187, label %._crit_edge170, label %.lr.ph162.us

.lr.ph166.us:                                     ; preds = %.lr.ph166.us..lr.ph166.us_crit_edge, %._crit_edge163.us
  %indvars.iv182 = phi i64 [ %indvars.iv.next183, %.lr.ph166.us..lr.ph166.us_crit_edge ], [ 998, %._crit_edge163.us ]
  %53 = phi double [ %59, %.lr.ph166.us..lr.ph166.us_crit_edge ], [ 1.000000e+00, %._crit_edge163.us ]
  %54 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv184, i64 %indvars.iv182
  %55 = load double, double* %54, align 8
  %56 = fmul double %55, %53
  %57 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv184, i64 %indvars.iv182
  %58 = load double, double* %57, align 8
  %59 = fadd double %56, %58
  %60 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv184, i64 %indvars.iv182
  store double %59, double* %60, align 8
  %61 = icmp sgt i64 %indvars.iv182, 1
  br i1 %61, label %.lr.ph166.us..lr.ph166.us_crit_edge, label %._crit_edge167.us

.lr.ph166.us..lr.ph166.us_crit_edge:              ; preds = %.lr.ph166.us
  %indvars.iv.next183 = add nsw i64 %indvars.iv182, -1
  br label %.lr.ph166.us

; <label>:62:                                     ; preds = %._crit_edge188, %.lr.ph162.us
  %indvars.iv178 = phi i64 [ %indvars.iv.next179, %._crit_edge188 ], [ 1, %.lr.ph162.us ]
  %63 = add nsw i64 %indvars.iv178, -1
  %64 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv184, i64 %63
  %65 = load double, double* %64, align 8
  %66 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv184, i64 %indvars.iv178
  %67 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %52, i64 %indvars.iv178
  %68 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv184, i64 %indvars.iv178
  %69 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next185, i64 %indvars.iv178
  %70 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv184, i64 %63
  %71 = insertelement <2 x double> undef, double %65, i32 0
  %72 = shufflevector <2 x double> %71, <2 x double> undef, <2 x i32> zeroinitializer
  %73 = fmul <2 x double> %72, <double 0xC08F400000000001, double 0xC08F400000000001>
  %74 = fadd <2 x double> %73, <double 0x409F440000000001, double 0x409F440000000001>
  %75 = extractelement <2 x double> %74, i32 0
  %76 = extractelement <2 x double> %74, i32 1
  %77 = fdiv double 0x408F400000000001, %75
  store double %77, double* %66, align 8
  %78 = load double, double* %67, align 8
  %79 = fmul double %78, 0xC09F400000000001
  %80 = load double, double* %68, align 8
  %81 = fmul double %80, 0xC0AF3E0000000001
  %82 = fsub double %81, %79
  %83 = load double, double* %69, align 8
  %84 = fmul double %83, 0xC09F400000000001
  %85 = fsub double %82, %84
  %86 = load double, double* %70, align 8
  %87 = fmul double %86, 0xC08F400000000001
  %88 = fsub double %85, %87
  %89 = fdiv double %88, %76
  %90 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv184, i64 %indvars.iv178
  store double %89, double* %90, align 8
  %exitcond181 = icmp eq i64 %indvars.iv178, 998
  br i1 %exitcond181, label %._crit_edge163.us, label %._crit_edge188

._crit_edge188:                                   ; preds = %62
  %indvars.iv.next179 = add nuw nsw i64 %indvars.iv178, 1
  br label %62

._crit_edge163.us:                                ; preds = %62
  %91 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv184, i64 999
  store double 1.000000e+00, double* %91, align 8
  br label %.lr.ph166.us

._crit_edge170:                                   ; preds = %._crit_edge167.us
  %92 = icmp slt i32 %.0171, 500
  br i1 %92, label %._crit_edge170..preheader152_crit_edge, label %._crit_edge172

._crit_edge170..preheader152_crit_edge:           ; preds = %._crit_edge170
  %93 = add nuw nsw i32 %.0171, 1
  br label %.preheader152

._crit_edge172:                                   ; preds = %._crit_edge170
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1000 x double]*) unnamed_addr #0 {
..preheader.us_crit_edge:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #4
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %..preheader.us_crit_edge
  %indvars.iv15 = phi i64 [ 0, %..preheader.us_crit_edge ], [ %indvars.iv.next16, %._crit_edge.us ]
  %5 = mul nuw nsw i64 %indvars.iv15, 1000
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %6 = add nuw nsw i64 %indvars.iv, %5
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %._crit_edge14
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge14, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv15, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge14

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next16, 1000
  br i1 %exitcond17, label %._crit_edge13, label %.preheader.us

._crit_edge13:                                    ; preds = %._crit_edge.us
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold }
attributes #5 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
