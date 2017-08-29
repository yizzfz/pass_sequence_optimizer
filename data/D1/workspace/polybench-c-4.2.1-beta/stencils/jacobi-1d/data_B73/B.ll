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
  %3 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #3
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #3
  %5 = bitcast i8* %3 to double*
  %6 = bitcast i8* %4 to double*
  tail call fastcc void @init_array(i32 2000, double* %5, double* %6)
  tail call void (...) @polybench_timer_start() #3
  %7 = bitcast i8* %3 to double*
  %8 = bitcast i8* %4 to double*
  tail call fastcc void @kernel_jacobi_1d(i32 500, i32 2000, double* %7, double* %8)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %10
  %14 = bitcast i8* %3 to double*
  tail call fastcc void @print_array(i32 2000, double* %14)
  br label %._crit_edge

._crit_edge:                                      ; preds = %10, %2, %13
  tail call void @free(i8* %3) #3
  tail call void @free(i8* %4) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, double*, double*) unnamed_addr #0 {
  %4 = icmp sgt i32 %0, 0
  br i1 %4, label %.lr.ph, label %.loopexit

.lr.ph:                                           ; preds = %3
  %5 = sitofp i32 %0 to double
  %6 = sext i32 %0 to i64
  %7 = insertelement <2 x double> undef, double %5, i32 0
  %8 = insertelement <2 x double> %7, double %5, i32 1
  br label %9

; <label>:9:                                      ; preds = %.lr.ph, %9
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %9 ]
  %storemerge1 = phi i32 [ 0, %.lr.ph ], [ %23, %9 ]
  %10 = sitofp i32 %storemerge1 to double
  %11 = sext i32 %storemerge1 to i64
  %12 = getelementptr inbounds double, double* %1, i64 %11
  %13 = trunc i64 %indvars.iv to i32
  %14 = sitofp i32 %13 to double
  %15 = insertelement <2 x double> undef, double %10, i32 0
  %16 = insertelement <2 x double> %15, double %14, i32 1
  %17 = fadd <2 x double> %16, <double 2.000000e+00, double 3.000000e+00>
  %18 = fdiv <2 x double> %17, %8
  %19 = extractelement <2 x double> %18, i32 0
  %20 = extractelement <2 x double> %18, i32 1
  store double %19, double* %12, align 8
  %21 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  store double %20, double* %21, align 8
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %22 = icmp slt i64 %indvars.iv.next, %6
  %23 = trunc i64 %indvars.iv.next to i32
  br i1 %22, label %9, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %9
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_jacobi_1d(i32, i32, double*, double*) unnamed_addr #0 {
  %5 = icmp sgt i32 %0, 0
  br i1 %5, label %._crit_edge.lr.ph, label %.loopexit

._crit_edge.lr.ph:                                ; preds = %4
  %6 = add nsw i32 %1, -1
  %7 = icmp sgt i32 %6, 1
  %8 = sext i32 %1 to i64
  %9 = add nsw i64 %8, -1
  br i1 %7, label %._crit_edge.us.preheader, label %.loopexit

._crit_edge.us.preheader:                         ; preds = %._crit_edge.lr.ph
  %10 = icmp sgt i64 %9, 2
  %smax = select i1 %10, i64 %9, i64 2
  %11 = add nsw i64 %smax, -1
  %scevgep = getelementptr double, double* %2, i64 1
  %12 = icmp sgt i64 %9, 2
  %smax46 = select i1 %12, i64 %9, i64 2
  %scevgep47 = getelementptr double, double* %2, i64 %smax46
  %13 = add nuw nsw i64 %smax46, 1
  %scevgep49 = getelementptr double, double* %3, i64 %13
  %14 = icmp sgt i64 %9, 2
  %smax60 = select i1 %14, i64 %9, i64 2
  %15 = add nsw i64 %smax60, -1
  %scevgep67 = getelementptr double, double* %3, i64 1
  %16 = icmp sgt i64 %9, 2
  %smax69 = select i1 %16, i64 %9, i64 2
  %scevgep70 = getelementptr double, double* %3, i64 %smax69
  %17 = add nuw nsw i64 %smax69, 1
  %scevgep72 = getelementptr double, double* %2, i64 %17
  %min.iters.check61 = icmp ult i64 %15, 4
  %min.iters.check = icmp ult i64 %11, 4
  %n.vec = and i64 %11, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %bound0 = icmp ult double* %scevgep, %scevgep49
  %bound1 = icmp ugt double* %scevgep47, %3
  %memcheck.conflict = and i1 %bound0, %bound1
  %ind.end = or i64 %n.vec, 1
  %cmp.n = icmp eq i64 %11, %n.vec
  %n.vec64 = and i64 %15, -4
  %cmp.zero65 = icmp eq i64 %n.vec64, 0
  %bound074 = icmp ult double* %scevgep67, %scevgep72
  %bound175 = icmp ugt double* %scevgep70, %2
  %memcheck.conflict77 = and i1 %bound074, %bound175
  %ind.end83 = or i64 %n.vec64, 1
  %cmp.n84 = icmp eq i64 %15, %n.vec64
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.preheader, %._crit_edge7.us
  %18 = phi i32 [ %44, %._crit_edge7.us ], [ 0, %._crit_edge.us.preheader ]
  br i1 %min.iters.check61, label %scalar.ph59.preheader, label %min.iters.checked62

scalar.ph59.preheader:                            ; preds = %middle.block58, %vector.memcheck78, %min.iters.checked62, %._crit_edge.us
  %indvars.iv.ph = phi i64 [ 1, %vector.memcheck78 ], [ 1, %min.iters.checked62 ], [ 1, %._crit_edge.us ], [ %ind.end83, %middle.block58 ]
  br label %scalar.ph59

min.iters.checked62:                              ; preds = %._crit_edge.us
  br i1 %cmp.zero65, label %scalar.ph59.preheader, label %vector.memcheck78

vector.memcheck78:                                ; preds = %min.iters.checked62
  br i1 %memcheck.conflict77, label %scalar.ph59.preheader, label %vector.body57.preheader

vector.body57.preheader:                          ; preds = %vector.memcheck78
  br label %vector.body57

vector.body57:                                    ; preds = %vector.body57.preheader, %vector.body57
  %index80 = phi i64 [ %index.next81, %vector.body57 ], [ 0, %vector.body57.preheader ]
  %offset.idx85 = or i64 %index80, 1
  %19 = add nsw i64 %offset.idx85, -1
  %20 = getelementptr inbounds double, double* %2, i64 %19
  %21 = bitcast double* %20 to <2 x double>*
  %wide.load90 = load <2 x double>, <2 x double>* %21, align 8, !alias.scope !1
  %22 = getelementptr double, double* %20, i64 2
  %23 = bitcast double* %22 to <2 x double>*
  %wide.load91 = load <2 x double>, <2 x double>* %23, align 8, !alias.scope !1
  %24 = getelementptr inbounds double, double* %2, i64 %offset.idx85
  %25 = bitcast double* %24 to <2 x double>*
  %wide.load92 = load <2 x double>, <2 x double>* %25, align 8, !alias.scope !1
  %26 = getelementptr double, double* %24, i64 2
  %27 = bitcast double* %26 to <2 x double>*
  %wide.load93 = load <2 x double>, <2 x double>* %27, align 8, !alias.scope !1
  %28 = fadd <2 x double> %wide.load90, %wide.load92
  %29 = fadd <2 x double> %wide.load91, %wide.load93
  %30 = add nuw nsw i64 %offset.idx85, 1
  %31 = getelementptr inbounds double, double* %2, i64 %30
  %32 = bitcast double* %31 to <2 x double>*
  %wide.load94 = load <2 x double>, <2 x double>* %32, align 8, !alias.scope !1
  %33 = getelementptr double, double* %31, i64 2
  %34 = bitcast double* %33 to <2 x double>*
  %wide.load95 = load <2 x double>, <2 x double>* %34, align 8, !alias.scope !1
  %35 = fadd <2 x double> %28, %wide.load94
  %36 = fadd <2 x double> %29, %wide.load95
  %37 = fmul <2 x double> %35, <double 3.333300e-01, double 3.333300e-01>
  %38 = fmul <2 x double> %36, <double 3.333300e-01, double 3.333300e-01>
  %39 = getelementptr inbounds double, double* %3, i64 %offset.idx85
  %40 = bitcast double* %39 to <2 x double>*
  store <2 x double> %37, <2 x double>* %40, align 8, !alias.scope !4, !noalias !1
  %41 = getelementptr double, double* %39, i64 2
  %42 = bitcast double* %41 to <2 x double>*
  store <2 x double> %38, <2 x double>* %42, align 8, !alias.scope !4, !noalias !1
  %index.next81 = add i64 %index80, 4
  %43 = icmp eq i64 %index.next81, %n.vec64
  br i1 %43, label %middle.block58, label %vector.body57, !llvm.loop !6

middle.block58:                                   ; preds = %vector.body57
  br i1 %cmp.n84, label %.lr.ph6.us.preheader, label %scalar.ph59.preheader

._crit_edge7.us.loopexit:                         ; preds = %.lr.ph6.us
  br label %._crit_edge7.us

._crit_edge7.us:                                  ; preds = %._crit_edge7.us.loopexit, %middle.block
  %44 = add nsw i32 %18, 1
  %45 = icmp slt i32 %44, %0
  br i1 %45, label %._crit_edge.us, label %.loopexit.loopexit

.lr.ph6.us:                                       ; preds = %.lr.ph6.us.preheader96, %.lr.ph6.us
  %indvars.iv29 = phi i64 [ %indvars.iv.next30, %.lr.ph6.us ], [ %indvars.iv29.ph, %.lr.ph6.us.preheader96 ]
  %46 = add nsw i64 %indvars.iv29, -1
  %47 = getelementptr inbounds double, double* %3, i64 %46
  %48 = load double, double* %47, align 8
  %49 = getelementptr inbounds double, double* %3, i64 %indvars.iv29
  %50 = load double, double* %49, align 8
  %51 = fadd double %48, %50
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %52 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next30
  %53 = load double, double* %52, align 8
  %54 = fadd double %51, %53
  %55 = fmul double %54, 3.333300e-01
  %56 = getelementptr inbounds double, double* %2, i64 %indvars.iv29
  store double %55, double* %56, align 8
  %57 = icmp slt i64 %indvars.iv.next30, %9
  br i1 %57, label %.lr.ph6.us, label %._crit_edge7.us.loopexit, !llvm.loop !9

scalar.ph59:                                      ; preds = %scalar.ph59.preheader, %scalar.ph59
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph59 ], [ %indvars.iv.ph, %scalar.ph59.preheader ]
  %58 = add nsw i64 %indvars.iv, -1
  %59 = getelementptr inbounds double, double* %2, i64 %58
  %60 = load double, double* %59, align 8
  %61 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  %62 = load double, double* %61, align 8
  %63 = fadd double %60, %62
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %64 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next
  %65 = load double, double* %64, align 8
  %66 = fadd double %63, %65
  %67 = fmul double %66, 3.333300e-01
  %68 = getelementptr inbounds double, double* %3, i64 %indvars.iv
  store double %67, double* %68, align 8
  %69 = icmp slt i64 %indvars.iv.next, %9
  br i1 %69, label %scalar.ph59, label %.lr.ph6.us.preheader.loopexit, !llvm.loop !10

.lr.ph6.us.preheader.loopexit:                    ; preds = %scalar.ph59
  br label %.lr.ph6.us.preheader

.lr.ph6.us.preheader:                             ; preds = %.lr.ph6.us.preheader.loopexit, %middle.block58
  br i1 %min.iters.check, label %.lr.ph6.us.preheader96, label %min.iters.checked

.lr.ph6.us.preheader96:                           ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph6.us.preheader
  %indvars.iv29.ph = phi i64 [ 1, %vector.memcheck ], [ 1, %min.iters.checked ], [ 1, %.lr.ph6.us.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph6.us

min.iters.checked:                                ; preds = %.lr.ph6.us.preheader
  br i1 %cmp.zero, label %.lr.ph6.us.preheader96, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  br i1 %memcheck.conflict, label %.lr.ph6.us.preheader96, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %70 = add nsw i64 %offset.idx, -1
  %71 = getelementptr inbounds double, double* %3, i64 %70
  %72 = bitcast double* %71 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %72, align 8, !alias.scope !11
  %73 = getelementptr double, double* %71, i64 2
  %74 = bitcast double* %73 to <2 x double>*
  %wide.load52 = load <2 x double>, <2 x double>* %74, align 8, !alias.scope !11
  %75 = getelementptr inbounds double, double* %3, i64 %offset.idx
  %76 = bitcast double* %75 to <2 x double>*
  %wide.load53 = load <2 x double>, <2 x double>* %76, align 8, !alias.scope !11
  %77 = getelementptr double, double* %75, i64 2
  %78 = bitcast double* %77 to <2 x double>*
  %wide.load54 = load <2 x double>, <2 x double>* %78, align 8, !alias.scope !11
  %79 = fadd <2 x double> %wide.load, %wide.load53
  %80 = fadd <2 x double> %wide.load52, %wide.load54
  %81 = add nuw nsw i64 %offset.idx, 1
  %82 = getelementptr inbounds double, double* %3, i64 %81
  %83 = bitcast double* %82 to <2 x double>*
  %wide.load55 = load <2 x double>, <2 x double>* %83, align 8, !alias.scope !11
  %84 = getelementptr double, double* %82, i64 2
  %85 = bitcast double* %84 to <2 x double>*
  %wide.load56 = load <2 x double>, <2 x double>* %85, align 8, !alias.scope !11
  %86 = fadd <2 x double> %79, %wide.load55
  %87 = fadd <2 x double> %80, %wide.load56
  %88 = fmul <2 x double> %86, <double 3.333300e-01, double 3.333300e-01>
  %89 = fmul <2 x double> %87, <double 3.333300e-01, double 3.333300e-01>
  %90 = getelementptr inbounds double, double* %2, i64 %offset.idx
  %91 = bitcast double* %90 to <2 x double>*
  store <2 x double> %88, <2 x double>* %91, align 8, !alias.scope !14, !noalias !11
  %92 = getelementptr double, double* %90, i64 2
  %93 = bitcast double* %92 to <2 x double>*
  store <2 x double> %89, <2 x double>* %93, align 8, !alias.scope !14, !noalias !11
  %index.next = add i64 %index, 4
  %94 = icmp eq i64 %index.next, %n.vec
  br i1 %94, label %middle.block, label %vector.body, !llvm.loop !16

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge7.us, label %.lr.ph6.us.preheader96

.loopexit.loopexit:                               ; preds = %._crit_edge7.us
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %._crit_edge.lr.ph, %4
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double*) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #4
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.lr.ph, label %.loopexit

.lr.ph:                                           ; preds = %2
  %8 = sext i32 %0 to i64
  br label %9

; <label>:9:                                      ; preds = %.lr.ph, %._crit_edge
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge ]
  %storemerge1 = phi i32 [ 0, %.lr.ph ], [ %19, %._crit_edge ]
  %10 = srem i32 %storemerge1, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %9
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #4
  br label %._crit_edge

._crit_edge:                                      ; preds = %9, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #5
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %18 = icmp slt i64 %indvars.iv.next, %8
  %19 = trunc i64 %indvars.iv.next to i32
  br i1 %18, label %9, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %._crit_edge
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %2
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #4
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
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.vectorize.width", i32 1}
!8 = !{!"llvm.loop.interleave.count", i32 1}
!9 = distinct !{!9, !7, !8}
!10 = distinct !{!10, !7, !8}
!11 = !{!12}
!12 = distinct !{!12, !13}
!13 = distinct !{!13, !"LVerDomain"}
!14 = !{!15}
!15 = distinct !{!15, !13}
!16 = distinct !{!16, !7, !8}
