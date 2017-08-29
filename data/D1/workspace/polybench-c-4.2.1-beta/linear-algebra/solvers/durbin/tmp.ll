; ModuleID = 'B.ll'
source_filename = "durbin.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"y\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %5 = bitcast i8* %3 to double*
  tail call void @init_array(i32 2000, double* %5)
  tail call void (...) @polybench_timer_start() #4
  %6 = bitcast i8* %3 to double*
  %7 = bitcast i8* %4 to double*
  tail call void @kernel_durbin(i32 2000, double* %6, double* %7)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %8 = icmp sgt i32 %0, 42
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %2
  %10 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %10, align 1
  %11 = icmp eq i8 %strcmpload, 0
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %9
  %13 = bitcast i8* %4 to double*
  tail call void @print_array(i32 2000, double* %13)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %9, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, double*) #2 {
.lr.ph.preheader:
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader
  %indvars.iv = phi i64 [ 0, %.lr.ph.preheader ], [ %indvars.iv.next.4, %.lr.ph ]
  %2 = sub nsw i64 1, %indvars.iv
  %3 = trunc i64 %2 to i32
  %4 = add nsw i32 %3, 2000
  %5 = sitofp i32 %4 to double
  %6 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %7 = bitcast double* %6 to <2 x double>*
  %8 = sub i64 0, %indvars.iv
  %9 = trunc i64 %8 to i32
  %10 = add nsw i32 %9, 2000
  %11 = sitofp i32 %10 to double
  %12 = insertelement <2 x double> undef, double %5, i32 0
  %13 = insertelement <2 x double> %12, double %11, i32 1
  store <2 x double> %13, <2 x double>* %7, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %14 = trunc i64 %indvars.iv to i32
  %15 = sub i32 1999, %14
  %16 = sitofp i32 %15 to double
  %17 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next.1
  %18 = bitcast double* %17 to <2 x double>*
  %19 = sub i64 -2, %indvars.iv
  %20 = trunc i64 %19 to i32
  %21 = add nsw i32 %20, 2000
  %22 = sitofp i32 %21 to double
  %23 = insertelement <2 x double> undef, double %16, i32 0
  %24 = insertelement <2 x double> %23, double %22, i32 1
  store <2 x double> %24, <2 x double>* %18, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %25 = sub i64 -3, %indvars.iv
  %26 = trunc i64 %25 to i32
  %27 = add nsw i32 %26, 2000
  %28 = sitofp i32 %27 to double
  %29 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next.3
  store double %28, double* %29, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %exitcond3.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond3.4, label %._crit_edge, label %.lr.ph

._crit_edge:                                      ; preds = %.lr.ph
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_durbin(i32, double*, double*) #2 {
.lr.ph16:
  %3 = alloca [2000 x double], align 16
  %4 = load double, double* %1, align 8
  %5 = fsub double -0.000000e+00, %4
  store double %5, double* %2, align 8
  %6 = load double, double* %1, align 8
  %7 = fsub double -0.000000e+00, %6
  %8 = bitcast [2000 x double]* %3 to i8*
  %9 = bitcast double* %2 to i8*
  %10 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 0, i64 0
  br label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.loopexit, %.lr.ph16
  %indvars.iv58 = phi i64 [ %indvars.iv.next59, %.loopexit ], [ 0, %.lr.ph16 ]
  %11 = phi double [ %46, %.loopexit ], [ 1.000000e+00, %.lr.ph16 ]
  %12 = phi double [ %51, %.loopexit ], [ %7, %.lr.ph16 ]
  %indvars.iv55 = phi i64 [ %indvars.iv.next56, %.loopexit ], [ 1, %.lr.ph16 ]
  %13 = shl nuw nsw i64 %indvars.iv58, 3
  %14 = fmul double %12, %12
  %15 = fsub double 1.000000e+00, %14
  %16 = and i64 %indvars.iv58, 1
  %lcmp.mod = icmp eq i64 %16, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.preheader, label %.lr.ph.prol.loopexit.unr-lcssa

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader
  %17 = shl i64 %indvars.iv55, 32
  %sext57.prol = add i64 %17, -4294967296
  %18 = ashr exact i64 %sext57.prol, 32
  %19 = getelementptr inbounds double, double* %1, i64 %18
  %20 = load double, double* %19, align 8
  %21 = load double, double* %2, align 8
  %22 = fmul double %20, %21
  %23 = fadd double %22, 0.000000e+00
  br label %.lr.ph.prol.loopexit.unr-lcssa

.lr.ph.prol.loopexit.unr-lcssa:                   ; preds = %.lr.ph.prol, %.lr.ph.preheader
  %.lcssa.unr.ph = phi double [ %23, %.lr.ph.prol ], [ undef, %.lr.ph.preheader ]
  %indvars.iv.unr.ph = phi i64 [ 1, %.lr.ph.prol ], [ 0, %.lr.ph.preheader ]
  %.unr.ph = phi double [ %23, %.lr.ph.prol ], [ 0.000000e+00, %.lr.ph.preheader ]
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.unr-lcssa
  %24 = icmp eq i64 %indvars.iv58, 0
  br i1 %24, label %.lr.ph10.preheader, label %.lr.ph.preheader.new

.lr.ph.preheader.new:                             ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.preheader.new ], [ %indvars.iv.next.1, %.lr.ph ]
  %25 = phi double [ %.unr.ph, %.lr.ph.preheader.new ], [ %45, %.lr.ph ]
  %26 = xor i64 %indvars.iv, 4294967295
  %27 = add i64 %indvars.iv55, %26
  %sext57 = shl i64 %27, 32
  %28 = ashr exact i64 %sext57, 32
  %29 = getelementptr inbounds double, double* %1, i64 %28
  %30 = load double, double* %29, align 8
  %31 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  %32 = bitcast double* %31 to <2 x double>*
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %33 = xor i64 %indvars.iv.next, 4294967295
  %34 = add i64 %indvars.iv55, %33
  %sext57.1 = shl i64 %34, 32
  %35 = ashr exact i64 %sext57.1, 32
  %36 = getelementptr inbounds double, double* %1, i64 %35
  %37 = load double, double* %36, align 8
  %38 = load <2 x double>, <2 x double>* %32, align 8
  %39 = insertelement <2 x double> undef, double %30, i32 0
  %40 = insertelement <2 x double> %39, double %37, i32 1
  %41 = fmul <2 x double> %40, %38
  %42 = extractelement <2 x double> %41, i32 0
  %43 = extractelement <2 x double> %41, i32 1
  %44 = fadd double %25, %42
  %45 = fadd double %44, %43
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %indvars.iv58
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %.lr.ph10.preheader.unr-lcssa, label %.lr.ph

.lr.ph10.preheader.unr-lcssa:                     ; preds = %.lr.ph
  br label %.lr.ph10.preheader

.lr.ph10.preheader:                               ; preds = %.lr.ph10.preheader.unr-lcssa, %.lr.ph.prol.loopexit
  %.lcssa = phi double [ %.lcssa.unr.ph, %.lr.ph.prol.loopexit ], [ %45, %.lr.ph10.preheader.unr-lcssa ]
  %46 = fmul double %11, %15
  %47 = getelementptr inbounds double, double* %1, i64 %indvars.iv55
  %48 = load double, double* %47, align 8
  %49 = fadd double %48, %.lcssa
  %50 = fsub double -0.000000e+00, %49
  %51 = fdiv double %50, %46
  %52 = and i64 %indvars.iv58, 1
  %lcmp.mod62 = icmp eq i64 %52, 0
  br i1 %lcmp.mod62, label %.lr.ph10.prol.preheader, label %.lr.ph10.prol.loopexit.unr-lcssa

.lr.ph10.prol.preheader:                          ; preds = %.lr.ph10.preheader
  br label %.lr.ph10.prol

.lr.ph10.prol:                                    ; preds = %.lr.ph10.prol.preheader
  %53 = load double, double* %2, align 8
  %54 = shl i64 %indvars.iv55, 32
  %sext.prol = add i64 %54, -4294967296
  %55 = ashr exact i64 %sext.prol, 32
  %56 = getelementptr inbounds double, double* %2, i64 %55
  %57 = load double, double* %56, align 8
  %58 = fmul double %51, %57
  %59 = fadd double %53, %58
  store double %59, double* %10, align 16
  br label %.lr.ph10.prol.loopexit.unr-lcssa

.lr.ph10.prol.loopexit.unr-lcssa:                 ; preds = %.lr.ph10.prol, %.lr.ph10.preheader
  %indvars.iv43.unr.ph = phi i64 [ 1, %.lr.ph10.prol ], [ 0, %.lr.ph10.preheader ]
  br label %.lr.ph10.prol.loopexit

.lr.ph10.prol.loopexit:                           ; preds = %.lr.ph10.prol.loopexit.unr-lcssa
  %60 = icmp eq i64 %indvars.iv58, 0
  br i1 %60, label %.loopexit, label %.lr.ph10.preheader.new

.lr.ph10.preheader.new:                           ; preds = %.lr.ph10.prol.loopexit
  br label %.lr.ph10

.lr.ph10:                                         ; preds = %.lr.ph10, %.lr.ph10.preheader.new
  %indvars.iv43 = phi i64 [ %indvars.iv43.unr.ph, %.lr.ph10.preheader.new ], [ %indvars.iv.next44.1, %.lr.ph10 ]
  %61 = getelementptr inbounds double, double* %2, i64 %indvars.iv43
  %62 = bitcast double* %61 to <2 x double>*
  %63 = xor i64 %indvars.iv43, 4294967295
  %64 = add i64 %indvars.iv55, %63
  %sext = shl i64 %64, 32
  %65 = ashr exact i64 %sext, 32
  %66 = getelementptr inbounds double, double* %2, i64 %65
  %67 = load double, double* %66, align 8
  %68 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 0, i64 %indvars.iv43
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %69 = load <2 x double>, <2 x double>* %62, align 8
  %70 = xor i64 %indvars.iv.next44, 4294967295
  %71 = add i64 %indvars.iv55, %70
  %sext.1 = shl i64 %71, 32
  %72 = ashr exact i64 %sext.1, 32
  %73 = getelementptr inbounds double, double* %2, i64 %72
  %74 = load double, double* %73, align 8
  %75 = insertelement <2 x double> undef, double %67, i32 0
  %76 = insertelement <2 x double> %75, double %74, i32 1
  %77 = insertelement <2 x double> undef, double %51, i32 0
  %78 = insertelement <2 x double> %77, double %51, i32 1
  %79 = fmul <2 x double> %78, %76
  %80 = fadd <2 x double> %69, %79
  %81 = bitcast double* %68 to <2 x double>*
  store <2 x double> %80, <2 x double>* %81, align 8
  %exitcond48.1 = icmp eq i64 %indvars.iv.next44, %indvars.iv58
  %indvars.iv.next44.1 = add nsw i64 %indvars.iv43, 2
  br i1 %exitcond48.1, label %.loopexit.unr-lcssa, label %.lr.ph10

.loopexit.unr-lcssa:                              ; preds = %.lr.ph10
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.unr-lcssa, %.lr.ph10.prol.loopexit
  %82 = add nuw nsw i64 %13, 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %9, i8* nonnull %8, i64 %82, i32 8, i1 false)
  %83 = getelementptr inbounds double, double* %2, i64 %indvars.iv55
  store double %51, double* %83, align 8
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %exitcond60 = icmp eq i64 %indvars.iv.next59, 1999
  br i1 %exitcond60, label %._crit_edge, label %.lr.ph.preheader

._crit_edge:                                      ; preds = %.loopexit
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, double*) #0 {
.lr.ph:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #6
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %6

; <label>:6:                                      ; preds = %._crit_edge2, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge2 ], [ 0, %.lr.ph ]
  %storemerge1 = phi i32 [ %15, %._crit_edge2 ], [ 0, %.lr.ph ]
  %7 = srem i32 %storemerge1, 20
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %._crit_edge2

; <label>:9:                                      ; preds = %6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %10) #6
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %9, %6
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %13 = load double, double* %12, align 8
  %14 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %13) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %15 = trunc i64 %indvars.iv.next to i32
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge, label %6

._crit_edge:                                      ; preds = %._crit_edge2
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
