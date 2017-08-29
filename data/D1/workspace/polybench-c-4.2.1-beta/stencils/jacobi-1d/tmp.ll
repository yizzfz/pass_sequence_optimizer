; ModuleID = 'B.ll'
source_filename = "jacobi-1d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %5 = bitcast i8* %3 to double*
  %6 = bitcast i8* %4 to double*
  tail call void @init_array(i32 2000, double* %5, double* %6)
  tail call void (...) @polybench_timer_start() #4
  %7 = bitcast i8* %3 to double*
  %8 = bitcast i8* %4 to double*
  tail call void @kernel_jacobi_1d(i32 500, i32 2000, double* %7, double* %8)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %10
  %14 = bitcast i8* %3 to double*
  tail call void @print_array(i32 2000, double* %14)
  br label %._crit_edge

._crit_edge:                                      ; preds = %13, %10, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, double*, double*) #2 {
.lr.ph:
  br label %3

; <label>:3:                                      ; preds = %3, %.lr.ph
  %indvars.iv3 = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next4, %3 ]
  %4 = trunc i64 %indvars.iv3 to i32
  %5 = sitofp i32 %4 to double
  %6 = getelementptr inbounds double, double* %1, i64 %indvars.iv3
  %7 = trunc i64 %indvars.iv3 to i32
  %8 = sitofp i32 %7 to double
  %9 = insertelement <2 x double> undef, double %5, i32 0
  %10 = insertelement <2 x double> %9, double %8, i32 1
  %11 = fadd <2 x double> %10, <double 2.000000e+00, double 3.000000e+00>
  %12 = fdiv <2 x double> %11, <double 2.000000e+03, double 2.000000e+03>
  %13 = extractelement <2 x double> %12, i32 0
  %14 = extractelement <2 x double> %12, i32 1
  store double %13, double* %6, align 8
  %15 = getelementptr inbounds double, double* %2, i64 %indvars.iv3
  store double %14, double* %15, align 8
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %exitcond = icmp eq i64 %indvars.iv3, 1999
  br i1 %exitcond, label %._crit_edge, label %3

._crit_edge:                                      ; preds = %3
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_jacobi_1d(i32, i32, double*, double*) #2 {
.preheader3.lr.ph:
  %scevgep = getelementptr double, double* %2, i64 1
  %scevgep36 = getelementptr double, double* %2, i64 1999
  %scevgep38 = getelementptr double, double* %3, i64 2000
  %scevgep51 = getelementptr double, double* %3, i64 1
  %scevgep53 = getelementptr double, double* %3, i64 1999
  %scevgep55 = getelementptr double, double* %2, i64 2000
  %bound057 = icmp ult double* %scevgep51, %scevgep55
  %bound158 = icmp ugt double* %scevgep53, %2
  %memcheck.conflict60 = and i1 %bound057, %bound158
  %bound0 = icmp ult double* %scevgep, %scevgep38
  %bound1 = icmp ugt double* %scevgep36, %3
  %memcheck.conflict = and i1 %bound0, %bound1
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %.loopexit.us, %.preheader3.lr.ph
  %4 = phi i32 [ 0, %.preheader3.lr.ph ], [ %97, %.loopexit.us ]
  br i1 %memcheck.conflict60, label %._crit_edge25.preheader, label %vector.body46.preheader

vector.body46.preheader:                          ; preds = %.preheader3.us
  br label %vector.body46

vector.body46:                                    ; preds = %vector.body46, %vector.body46.preheader
  %index63 = phi i64 [ %index.next64, %vector.body46 ], [ 0, %vector.body46.preheader ]
  %offset.idx67 = or i64 %index63, 1
  %5 = add nsw i64 %offset.idx67, -1
  %6 = getelementptr inbounds double, double* %2, i64 %5
  %7 = bitcast double* %6 to <2 x double>*
  %wide.load72 = load <2 x double>, <2 x double>* %7, align 8, !alias.scope !1
  %8 = getelementptr double, double* %6, i64 2
  %9 = bitcast double* %8 to <2 x double>*
  %wide.load73 = load <2 x double>, <2 x double>* %9, align 8, !alias.scope !1
  %10 = getelementptr inbounds double, double* %2, i64 %offset.idx67
  %11 = bitcast double* %10 to <2 x double>*
  %wide.load74 = load <2 x double>, <2 x double>* %11, align 8, !alias.scope !1
  %12 = getelementptr double, double* %10, i64 2
  %13 = bitcast double* %12 to <2 x double>*
  %wide.load75 = load <2 x double>, <2 x double>* %13, align 8, !alias.scope !1
  %14 = fadd <2 x double> %wide.load72, %wide.load74
  %15 = fadd <2 x double> %wide.load73, %wide.load75
  %16 = add nuw nsw i64 %offset.idx67, 1
  %17 = getelementptr inbounds double, double* %2, i64 %16
  %18 = bitcast double* %17 to <2 x double>*
  %wide.load76 = load <2 x double>, <2 x double>* %18, align 8, !alias.scope !1
  %19 = getelementptr double, double* %17, i64 2
  %20 = bitcast double* %19 to <2 x double>*
  %wide.load77 = load <2 x double>, <2 x double>* %20, align 8, !alias.scope !1
  %21 = fadd <2 x double> %14, %wide.load76
  %22 = fadd <2 x double> %15, %wide.load77
  %23 = fmul <2 x double> %21, <double 3.333300e-01, double 3.333300e-01>
  %24 = fmul <2 x double> %22, <double 3.333300e-01, double 3.333300e-01>
  %25 = getelementptr inbounds double, double* %3, i64 %offset.idx67
  %26 = bitcast double* %25 to <2 x double>*
  store <2 x double> %23, <2 x double>* %26, align 8, !alias.scope !4, !noalias !1
  %27 = getelementptr double, double* %25, i64 2
  %28 = bitcast double* %27 to <2 x double>*
  store <2 x double> %24, <2 x double>* %28, align 8, !alias.scope !4, !noalias !1
  %index.next64 = add nuw nsw i64 %index63, 4
  %29 = icmp eq i64 %index.next64, 1996
  br i1 %29, label %._crit_edge25.preheader.loopexit, label %vector.body46, !llvm.loop !6

._crit_edge25.preheader.loopexit:                 ; preds = %vector.body46
  br label %._crit_edge25.preheader

._crit_edge25.preheader:                          ; preds = %._crit_edge25.preheader.loopexit, %.preheader3.us
  %indvars.iv.ph = phi i64 [ 1, %.preheader3.us ], [ 1997, %._crit_edge25.preheader.loopexit ]
  br i1 false, label %._crit_edge25.prol.preheader, label %._crit_edge25.prol.loopexit.unr-lcssa

._crit_edge25.prol.preheader:                     ; preds = %._crit_edge25.preheader
  br label %._crit_edge25.prol

._crit_edge25.prol:                               ; preds = %._crit_edge25.prol.preheader
  br label %._crit_edge25.prol.loopexit.unr-lcssa

._crit_edge25.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge25.prol, %._crit_edge25.preheader
  br label %._crit_edge25.prol.loopexit

._crit_edge25.prol.loopexit:                      ; preds = %._crit_edge25.prol.loopexit.unr-lcssa
  br i1 false, label %vector.memcheck, label %._crit_edge25.preheader.new

._crit_edge25.preheader.new:                      ; preds = %._crit_edge25.prol.loopexit
  br label %._crit_edge25

._crit_edge25:                                    ; preds = %._crit_edge25, %._crit_edge25.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.ph, %._crit_edge25.preheader.new ], [ %indvars.iv.next.1, %._crit_edge25 ]
  %30 = add nsw i64 %indvars.iv, -1
  %31 = getelementptr inbounds double, double* %2, i64 %30
  %32 = load double, double* %31, align 8
  %33 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  %34 = load double, double* %33, align 8
  %35 = fadd double %32, %34
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %36 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next
  %37 = load double, double* %36, align 8
  %38 = fadd double %35, %37
  %39 = fmul double %38, 3.333300e-01
  %40 = getelementptr inbounds double, double* %3, i64 %indvars.iv
  store double %39, double* %40, align 8
  %41 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  %42 = load double, double* %41, align 8
  %43 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next
  %44 = load double, double* %43, align 8
  %45 = fadd double %42, %44
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %46 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.1
  %47 = load double, double* %46, align 8
  %48 = fadd double %45, %47
  %49 = fmul double %48, 3.333300e-01
  %50 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next
  store double %49, double* %50, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 1998
  br i1 %exitcond.1, label %vector.memcheck.unr-lcssa, label %._crit_edge25, !llvm.loop !9

vector.memcheck.unr-lcssa:                        ; preds = %._crit_edge25
  br label %vector.memcheck

vector.memcheck:                                  ; preds = %vector.memcheck.unr-lcssa, %._crit_edge25.prol.loopexit
  br i1 %memcheck.conflict, label %.lr.ph6.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %51 = add nsw i64 %offset.idx, -1
  %52 = getelementptr inbounds double, double* %3, i64 %51
  %53 = bitcast double* %52 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %53, align 8, !alias.scope !10
  %54 = getelementptr double, double* %52, i64 2
  %55 = bitcast double* %54 to <2 x double>*
  %wide.load41 = load <2 x double>, <2 x double>* %55, align 8, !alias.scope !10
  %56 = getelementptr inbounds double, double* %3, i64 %offset.idx
  %57 = bitcast double* %56 to <2 x double>*
  %wide.load42 = load <2 x double>, <2 x double>* %57, align 8, !alias.scope !10
  %58 = getelementptr double, double* %56, i64 2
  %59 = bitcast double* %58 to <2 x double>*
  %wide.load43 = load <2 x double>, <2 x double>* %59, align 8, !alias.scope !10
  %60 = fadd <2 x double> %wide.load, %wide.load42
  %61 = fadd <2 x double> %wide.load41, %wide.load43
  %62 = add nuw nsw i64 %offset.idx, 1
  %63 = getelementptr inbounds double, double* %3, i64 %62
  %64 = bitcast double* %63 to <2 x double>*
  %wide.load44 = load <2 x double>, <2 x double>* %64, align 8, !alias.scope !10
  %65 = getelementptr double, double* %63, i64 2
  %66 = bitcast double* %65 to <2 x double>*
  %wide.load45 = load <2 x double>, <2 x double>* %66, align 8, !alias.scope !10
  %67 = fadd <2 x double> %60, %wide.load44
  %68 = fadd <2 x double> %61, %wide.load45
  %69 = fmul <2 x double> %67, <double 3.333300e-01, double 3.333300e-01>
  %70 = fmul <2 x double> %68, <double 3.333300e-01, double 3.333300e-01>
  %71 = getelementptr inbounds double, double* %2, i64 %offset.idx
  %72 = bitcast double* %71 to <2 x double>*
  store <2 x double> %69, <2 x double>* %72, align 8, !alias.scope !13, !noalias !10
  %73 = getelementptr double, double* %71, i64 2
  %74 = bitcast double* %73 to <2 x double>*
  store <2 x double> %70, <2 x double>* %74, align 8, !alias.scope !13, !noalias !10
  %index.next = add nuw nsw i64 %index, 4
  %75 = icmp eq i64 %index.next, 1996
  br i1 %75, label %.lr.ph6.us.preheader.loopexit, label %vector.body, !llvm.loop !15

.lr.ph6.us.preheader.loopexit:                    ; preds = %vector.body
  br label %.lr.ph6.us.preheader

.lr.ph6.us.preheader:                             ; preds = %.lr.ph6.us.preheader.loopexit, %vector.memcheck
  %indvars.iv29.ph = phi i64 [ 1, %vector.memcheck ], [ 1997, %.lr.ph6.us.preheader.loopexit ]
  br i1 false, label %.lr.ph6.us.prol.preheader, label %.lr.ph6.us.prol.loopexit.unr-lcssa

.lr.ph6.us.prol.preheader:                        ; preds = %.lr.ph6.us.preheader
  br label %.lr.ph6.us.prol

.lr.ph6.us.prol:                                  ; preds = %.lr.ph6.us.prol.preheader
  br label %.lr.ph6.us.prol.loopexit.unr-lcssa

.lr.ph6.us.prol.loopexit.unr-lcssa:               ; preds = %.lr.ph6.us.prol, %.lr.ph6.us.preheader
  br label %.lr.ph6.us.prol.loopexit

.lr.ph6.us.prol.loopexit:                         ; preds = %.lr.ph6.us.prol.loopexit.unr-lcssa
  br i1 false, label %.loopexit.us, label %.lr.ph6.us.preheader.new

.lr.ph6.us.preheader.new:                         ; preds = %.lr.ph6.us.prol.loopexit
  br label %.lr.ph6.us

.lr.ph6.us:                                       ; preds = %.lr.ph6.us, %.lr.ph6.us.preheader.new
  %indvars.iv29 = phi i64 [ %indvars.iv29.ph, %.lr.ph6.us.preheader.new ], [ %indvars.iv.next30.1, %.lr.ph6.us ]
  %76 = add nsw i64 %indvars.iv29, -1
  %77 = getelementptr inbounds double, double* %3, i64 %76
  %78 = load double, double* %77, align 8
  %79 = getelementptr inbounds double, double* %3, i64 %indvars.iv29
  %80 = load double, double* %79, align 8
  %81 = fadd double %78, %80
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %82 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next30
  %83 = load double, double* %82, align 8
  %84 = fadd double %81, %83
  %85 = fmul double %84, 3.333300e-01
  %86 = getelementptr inbounds double, double* %2, i64 %indvars.iv29
  store double %85, double* %86, align 8
  %87 = getelementptr inbounds double, double* %3, i64 %indvars.iv29
  %88 = load double, double* %87, align 8
  %89 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next30
  %90 = load double, double* %89, align 8
  %91 = fadd double %88, %90
  %indvars.iv.next30.1 = add nsw i64 %indvars.iv29, 2
  %92 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next30.1
  %93 = load double, double* %92, align 8
  %94 = fadd double %91, %93
  %95 = fmul double %94, 3.333300e-01
  %96 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next30
  store double %95, double* %96, align 8
  %exitcond33.1 = icmp eq i64 %indvars.iv.next30.1, 1999
  br i1 %exitcond33.1, label %.loopexit.us.unr-lcssa, label %.lr.ph6.us, !llvm.loop !16

.loopexit.us.unr-lcssa:                           ; preds = %.lr.ph6.us
  br label %.loopexit.us

.loopexit.us:                                     ; preds = %.loopexit.us.unr-lcssa, %.lr.ph6.us.prol.loopexit
  %97 = add nuw nsw i32 %4, 1
  %exitcond34 = icmp eq i32 %97, 500
  br i1 %exitcond34, label %._crit_edge, label %.preheader3.us

._crit_edge:                                      ; preds = %.loopexit.us
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, double*) #0 {
.lr.ph:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %6

; <label>:6:                                      ; preds = %._crit_edge2, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge2 ], [ 0, %.lr.ph ]
  %storemerge1 = phi i32 [ %15, %._crit_edge2 ], [ 0, %.lr.ph ]
  %7 = srem i32 %storemerge1, 20
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %._crit_edge2

; <label>:9:                                      ; preds = %6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %10) #5
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %9, %6
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %13 = load double, double* %12, align 8
  %14 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %13) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %15 = trunc i64 %indvars.iv.next to i32
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge, label %6

._crit_edge:                                      ; preds = %._crit_edge2
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.vectorize.width", i32 1}
!8 = !{!"llvm.loop.interleave.count", i32 1}
!9 = distinct !{!9, !7, !8}
!10 = !{!11}
!11 = distinct !{!11, !12}
!12 = distinct !{!12, !"LVerDomain"}
!13 = !{!14}
!14 = distinct !{!14, !12}
!15 = distinct !{!15, !7, !8}
!16 = distinct !{!16, !7, !8}
