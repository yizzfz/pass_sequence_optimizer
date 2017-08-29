; ModuleID = 'A.ll'
source_filename = "jacobi-1d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %.cast = bitcast i8* %3 to double*
  %.cast1 = bitcast i8* %4 to double*
  tail call fastcc void @init_array(i32 2000, double* %.cast, double* %.cast1)
  tail call void (...) @polybench_timer_start() #4
  %5 = bitcast i8* %3 to double*
  %6 = bitcast i8* %4 to double*
  tail call fastcc void @kernel_jacobi_1d(i32 500, i32 2000, double* %5, double* %6)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %7 = icmp sgt i32 %0, 42
  br i1 %7, label %8, label %._crit_edge

; <label>:8:                                      ; preds = %2
  %9 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %9, align 1
  %10 = icmp eq i8 %strcmpload, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %8
  %12 = bitcast i8* %3 to double*
  tail call fastcc void @print_array(i32 2000, double* %12)
  br label %._crit_edge

._crit_edge:                                      ; preds = %8, %2, %11
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, double*, double*) unnamed_addr #2 {
  br i1 true, label %.lr.ph, label %.loopexit

.lr.ph:                                           ; preds = %3
  br i1 false, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph
  br i1 false, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep = getelementptr double, double* %1, i64 2000
  %scevgep2 = getelementptr double, double* %2, i64 2000
  %bound0 = icmp ugt double* %scevgep2, %1
  %bound1 = icmp ugt double* %scevgep, %2
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %scalar.ph.preheader, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind4 = phi <2 x i32> [ <i32 0, i32 1>, %vector.ph ], [ %vec.ind.next5, %vector.body ]
  %4 = sitofp <2 x i32> %vec.ind4 to <2 x double>
  %5 = fadd <2 x double> %4, <double 2.000000e+00, double 2.000000e+00>
  %6 = fdiv <2 x double> %5, <double 2.000000e+03, double 2.000000e+03>
  %7 = getelementptr inbounds double, double* %1, i64 %index
  %8 = bitcast double* %7 to <2 x double>*
  store <2 x double> %6, <2 x double>* %8, align 8, !alias.scope !1, !noalias !4
  %9 = fadd <2 x double> %4, <double 3.000000e+00, double 3.000000e+00>
  %10 = fdiv <2 x double> %9, <double 2.000000e+03, double 2.000000e+03>
  %11 = getelementptr inbounds double, double* %2, i64 %index
  %12 = bitcast double* %11 to <2 x double>*
  store <2 x double> %10, <2 x double>* %12, align 8, !alias.scope !4
  %index.next = add i64 %index, 2
  %vec.ind.next5 = add <2 x i32> %vec.ind4, <i32 2, i32 2>
  %13 = icmp eq i64 %index.next, 2000
  br i1 %13, label %middle.block, label %vector.body, !llvm.loop !6

middle.block:                                     ; preds = %vector.body
  br i1 true, label %.loopexit, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.lr.ph ], [ 2000, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph ], [ %indvars.iv.ph, %scalar.ph.preheader ]
  %14 = trunc i64 %indvars.iv to i32
  %15 = sitofp i32 %14 to double
  %16 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %17 = insertelement <2 x double> undef, double %15, i32 0
  %18 = insertelement <2 x double> %17, double %15, i32 1
  %19 = fadd <2 x double> %18, <double 2.000000e+00, double 3.000000e+00>
  %20 = fdiv <2 x double> %19, <double 2.000000e+03, double 2.000000e+03>
  %21 = extractelement <2 x double> %20, i32 0
  %22 = extractelement <2 x double> %20, i32 1
  store double %21, double* %16, align 8
  %23 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  store double %22, double* %23, align 8
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %24 = icmp slt i64 %indvars.iv.next, 2000
  br i1 %24, label %scalar.ph, label %.loopexit.loopexit, !llvm.loop !9

.loopexit.loopexit:                               ; preds = %scalar.ph
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %middle.block, %3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_1d(i32, i32, double*, double*) unnamed_addr #2 {
  br i1 true, label %._crit_edge.lr.ph, label %._crit_edge.lr.ph.split

._crit_edge.lr.ph:                                ; preds = %4
  br i1 true, label %._crit_edge.us.preheader, label %._crit_edge.lr.ph.split

._crit_edge.us.preheader:                         ; preds = %._crit_edge.lr.ph
  %scevgep = getelementptr double, double* %2, i64 1
  %scevgep37 = getelementptr double, double* %2, i64 1999
  %scevgep39 = getelementptr double, double* %3, i64 2000
  %scevgep57 = getelementptr double, double* %3, i64 1
  %scevgep60 = getelementptr double, double* %3, i64 1999
  %scevgep62 = getelementptr double, double* %2, i64 2000
  %bound0 = icmp ult double* %scevgep, %scevgep39
  %bound1 = icmp ugt double* %scevgep37, %3
  %memcheck.conflict = and i1 %bound0, %bound1
  %bound064 = icmp ult double* %scevgep57, %scevgep62
  %bound165 = icmp ugt double* %scevgep60, %2
  %memcheck.conflict67 = and i1 %bound064, %bound165
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.preheader, %._crit_edge5.us
  %5 = phi i32 [ %31, %._crit_edge5.us ], [ 0, %._crit_edge.us.preheader ]
  br i1 false, label %scalar.ph49.preheader, label %min.iters.checked52

scalar.ph49.preheader:                            ; preds = %middle.block48, %vector.memcheck68, %min.iters.checked52, %._crit_edge.us
  %indvars.iv.ph = phi i64 [ 1, %vector.memcheck68 ], [ 1, %min.iters.checked52 ], [ 1, %._crit_edge.us ], [ 1997, %middle.block48 ]
  br label %scalar.ph49

min.iters.checked52:                              ; preds = %._crit_edge.us
  br i1 false, label %scalar.ph49.preheader, label %vector.memcheck68

vector.memcheck68:                                ; preds = %min.iters.checked52
  br i1 %memcheck.conflict67, label %scalar.ph49.preheader, label %vector.body47.preheader

vector.body47.preheader:                          ; preds = %vector.memcheck68
  br label %vector.body47

vector.body47:                                    ; preds = %vector.body47.preheader, %vector.body47
  %index70 = phi i64 [ %index.next71, %vector.body47 ], [ 0, %vector.body47.preheader ]
  %offset.idx75 = or i64 %index70, 1
  %6 = add nsw i64 %offset.idx75, -1
  %7 = getelementptr inbounds double, double* %2, i64 %6
  %8 = bitcast double* %7 to <2 x double>*
  %wide.load80 = load <2 x double>, <2 x double>* %8, align 8, !alias.scope !10
  %9 = getelementptr double, double* %7, i64 2
  %10 = bitcast double* %9 to <2 x double>*
  %wide.load81 = load <2 x double>, <2 x double>* %10, align 8, !alias.scope !10
  %11 = getelementptr inbounds double, double* %2, i64 %offset.idx75
  %12 = bitcast double* %11 to <2 x double>*
  %wide.load82 = load <2 x double>, <2 x double>* %12, align 8, !alias.scope !10
  %13 = getelementptr double, double* %11, i64 2
  %14 = bitcast double* %13 to <2 x double>*
  %wide.load83 = load <2 x double>, <2 x double>* %14, align 8, !alias.scope !10
  %15 = fadd <2 x double> %wide.load80, %wide.load82
  %16 = fadd <2 x double> %wide.load81, %wide.load83
  %17 = add nuw nsw i64 %offset.idx75, 1
  %18 = getelementptr inbounds double, double* %2, i64 %17
  %19 = bitcast double* %18 to <2 x double>*
  %wide.load84 = load <2 x double>, <2 x double>* %19, align 8, !alias.scope !10
  %20 = getelementptr double, double* %18, i64 2
  %21 = bitcast double* %20 to <2 x double>*
  %wide.load85 = load <2 x double>, <2 x double>* %21, align 8, !alias.scope !10
  %22 = fadd <2 x double> %15, %wide.load84
  %23 = fadd <2 x double> %16, %wide.load85
  %24 = fmul <2 x double> %22, <double 3.333300e-01, double 3.333300e-01>
  %25 = fmul <2 x double> %23, <double 3.333300e-01, double 3.333300e-01>
  %26 = getelementptr inbounds double, double* %3, i64 %offset.idx75
  %27 = bitcast double* %26 to <2 x double>*
  store <2 x double> %24, <2 x double>* %27, align 8, !alias.scope !13, !noalias !10
  %28 = getelementptr double, double* %26, i64 2
  %29 = bitcast double* %28 to <2 x double>*
  store <2 x double> %25, <2 x double>* %29, align 8, !alias.scope !13, !noalias !10
  %index.next71 = add i64 %index70, 4
  %30 = icmp eq i64 %index.next71, 1996
  br i1 %30, label %middle.block48, label %vector.body47, !llvm.loop !15

middle.block48:                                   ; preds = %vector.body47
  br i1 false, label %.lr.ph4.us.preheader, label %scalar.ph49.preheader

._crit_edge5.us.loopexit:                         ; preds = %.lr.ph4.us
  br label %._crit_edge5.us

._crit_edge5.us:                                  ; preds = %._crit_edge5.us.loopexit, %middle.block
  %31 = add nsw i32 %5, 1
  %32 = icmp slt i32 %31, 500
  br i1 %32, label %._crit_edge.us, label %._crit_edge.lr.ph.split.loopexit

.lr.ph4.us:                                       ; preds = %.lr.ph4.us.preheader86, %.lr.ph4.us
  %indvars.iv25 = phi i64 [ %39, %.lr.ph4.us ], [ %indvars.iv25.ph, %.lr.ph4.us.preheader86 ]
  %33 = add nsw i64 %indvars.iv25, -1
  %34 = getelementptr inbounds double, double* %3, i64 %33
  %35 = load double, double* %34, align 8
  %36 = getelementptr inbounds double, double* %3, i64 %indvars.iv25
  %37 = load double, double* %36, align 8
  %38 = fadd double %35, %37
  %39 = add nuw nsw i64 %indvars.iv25, 1
  %40 = getelementptr inbounds double, double* %3, i64 %39
  %41 = load double, double* %40, align 8
  %42 = fadd double %38, %41
  %43 = fmul double %42, 3.333300e-01
  %44 = getelementptr inbounds double, double* %2, i64 %indvars.iv25
  store double %43, double* %44, align 8
  %45 = icmp slt i64 %39, 1999
  br i1 %45, label %.lr.ph4.us, label %._crit_edge5.us.loopexit, !llvm.loop !16

scalar.ph49:                                      ; preds = %scalar.ph49.preheader, %scalar.ph49
  %indvars.iv = phi i64 [ %52, %scalar.ph49 ], [ %indvars.iv.ph, %scalar.ph49.preheader ]
  %46 = add nsw i64 %indvars.iv, -1
  %47 = getelementptr inbounds double, double* %2, i64 %46
  %48 = load double, double* %47, align 8
  %49 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  %50 = load double, double* %49, align 8
  %51 = fadd double %48, %50
  %52 = add nuw nsw i64 %indvars.iv, 1
  %53 = getelementptr inbounds double, double* %2, i64 %52
  %54 = load double, double* %53, align 8
  %55 = fadd double %51, %54
  %56 = fmul double %55, 3.333300e-01
  %57 = getelementptr inbounds double, double* %3, i64 %indvars.iv
  store double %56, double* %57, align 8
  %58 = icmp slt i64 %52, 1999
  br i1 %58, label %scalar.ph49, label %.lr.ph4.us.preheader.loopexit, !llvm.loop !17

.lr.ph4.us.preheader.loopexit:                    ; preds = %scalar.ph49
  br label %.lr.ph4.us.preheader

.lr.ph4.us.preheader:                             ; preds = %.lr.ph4.us.preheader.loopexit, %middle.block48
  br i1 false, label %.lr.ph4.us.preheader86, label %min.iters.checked

.lr.ph4.us.preheader86:                           ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph4.us.preheader
  %indvars.iv25.ph = phi i64 [ 1, %vector.memcheck ], [ 1, %min.iters.checked ], [ 1, %.lr.ph4.us.preheader ], [ 1997, %middle.block ]
  br label %.lr.ph4.us

min.iters.checked:                                ; preds = %.lr.ph4.us.preheader
  br i1 false, label %.lr.ph4.us.preheader86, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  br i1 %memcheck.conflict, label %.lr.ph4.us.preheader86, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %59 = add nsw i64 %offset.idx, -1
  %60 = getelementptr inbounds double, double* %3, i64 %59
  %61 = bitcast double* %60 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %61, align 8, !alias.scope !18
  %62 = getelementptr double, double* %60, i64 2
  %63 = bitcast double* %62 to <2 x double>*
  %wide.load42 = load <2 x double>, <2 x double>* %63, align 8, !alias.scope !18
  %64 = getelementptr inbounds double, double* %3, i64 %offset.idx
  %65 = bitcast double* %64 to <2 x double>*
  %wide.load43 = load <2 x double>, <2 x double>* %65, align 8, !alias.scope !18
  %66 = getelementptr double, double* %64, i64 2
  %67 = bitcast double* %66 to <2 x double>*
  %wide.load44 = load <2 x double>, <2 x double>* %67, align 8, !alias.scope !18
  %68 = fadd <2 x double> %wide.load, %wide.load43
  %69 = fadd <2 x double> %wide.load42, %wide.load44
  %70 = add nuw nsw i64 %offset.idx, 1
  %71 = getelementptr inbounds double, double* %3, i64 %70
  %72 = bitcast double* %71 to <2 x double>*
  %wide.load45 = load <2 x double>, <2 x double>* %72, align 8, !alias.scope !18
  %73 = getelementptr double, double* %71, i64 2
  %74 = bitcast double* %73 to <2 x double>*
  %wide.load46 = load <2 x double>, <2 x double>* %74, align 8, !alias.scope !18
  %75 = fadd <2 x double> %68, %wide.load45
  %76 = fadd <2 x double> %69, %wide.load46
  %77 = fmul <2 x double> %75, <double 3.333300e-01, double 3.333300e-01>
  %78 = fmul <2 x double> %76, <double 3.333300e-01, double 3.333300e-01>
  %79 = getelementptr inbounds double, double* %2, i64 %offset.idx
  %80 = bitcast double* %79 to <2 x double>*
  store <2 x double> %77, <2 x double>* %80, align 8, !alias.scope !21, !noalias !18
  %81 = getelementptr double, double* %79, i64 2
  %82 = bitcast double* %81 to <2 x double>*
  store <2 x double> %78, <2 x double>* %82, align 8, !alias.scope !21, !noalias !18
  %index.next = add i64 %index, 4
  %83 = icmp eq i64 %index.next, 1996
  br i1 %83, label %middle.block, label %vector.body, !llvm.loop !23

middle.block:                                     ; preds = %vector.body
  br i1 false, label %._crit_edge5.us, label %.lr.ph4.us.preheader86

._crit_edge.lr.ph.split.loopexit:                 ; preds = %._crit_edge5.us
  br label %._crit_edge.lr.ph.split

._crit_edge.lr.ph.split:                          ; preds = %._crit_edge.lr.ph.split.loopexit, %._crit_edge.lr.ph, %4
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double*) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br i1 true, label %.lr.ph, label %.loopexit

.lr.ph:                                           ; preds = %2
  br label %7

; <label>:7:                                      ; preds = %.lr.ph, %._crit_edge
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge ]
  %8 = trunc i64 %indvars.iv to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %7
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %7, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %17 = icmp slt i64 %indvars.iv.next, 2000
  br i1 %17, label %7, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %._crit_edge
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %2
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

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
!17 = distinct !{!17, !7, !8}
!18 = !{!19}
!19 = distinct !{!19, !20}
!20 = distinct !{!20, !"LVerDomain"}
!21 = !{!22}
!22 = distinct !{!22, !20}
!23 = distinct !{!23, !7, !8}
