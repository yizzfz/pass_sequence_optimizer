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
  %4 = icmp sgt i32 %0, 0
  br i1 %4, label %.lr.ph, label %.loopexit

.lr.ph:                                           ; preds = %3
  %5 = sitofp i32 %0 to double
  %6 = sext i32 %0 to i64
  %7 = insertelement <2 x double> undef, double %5, i32 0
  %8 = shufflevector <2 x double> %7, <2 x double> undef, <2 x i32> zeroinitializer
  br label %9

; <label>:9:                                      ; preds = %.lr.ph, %9
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %9 ]
  %10 = trunc i64 %indvars.iv to i32
  %11 = sitofp i32 %10 to double
  %12 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %13 = insertelement <2 x double> undef, double %11, i32 0
  %14 = shufflevector <2 x double> %13, <2 x double> undef, <2 x i32> zeroinitializer
  %15 = fadd <2 x double> %14, <double 2.000000e+00, double 3.000000e+00>
  %16 = fdiv <2 x double> %15, %8
  %17 = extractelement <2 x double> %16, i32 0
  %18 = extractelement <2 x double> %16, i32 1
  store double %17, double* %12, align 8
  %19 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  store double %18, double* %19, align 8
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %20 = icmp slt i64 %indvars.iv.next, %6
  br i1 %20, label %9, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %9
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_1d(i32, i32, double*, double*) unnamed_addr #2 {
  %5 = icmp sgt i32 %0, 0
  br i1 %5, label %._crit_edge.lr.ph, label %._crit_edge.lr.ph.split

._crit_edge.lr.ph:                                ; preds = %4
  %6 = add nsw i32 %1, -1
  %7 = icmp sgt i32 %6, 1
  %8 = sext i32 %1 to i64
  %9 = add nsw i64 %8, -1
  br i1 %7, label %._crit_edge.us.preheader, label %._crit_edge.lr.ph.split

._crit_edge.us.preheader:                         ; preds = %._crit_edge.lr.ph
  %10 = icmp sgt i64 %9, 2
  %smax = select i1 %10, i64 %9, i64 2
  %11 = add nsw i64 %smax, -1
  %scevgep = getelementptr double, double* %2, i64 1
  %12 = icmp sgt i64 %9, 2
  %smax36 = select i1 %12, i64 %9, i64 2
  %scevgep37 = getelementptr double, double* %2, i64 %smax36
  %13 = add nuw nsw i64 %smax36, 1
  %scevgep39 = getelementptr double, double* %3, i64 %13
  %14 = icmp sgt i64 %9, 2
  %smax50 = select i1 %14, i64 %9, i64 2
  %15 = add nsw i64 %smax50, -1
  %scevgep57 = getelementptr double, double* %3, i64 1
  %16 = icmp sgt i64 %9, 2
  %smax59 = select i1 %16, i64 %9, i64 2
  %scevgep60 = getelementptr double, double* %3, i64 %smax59
  %17 = add nuw nsw i64 %smax59, 1
  %scevgep62 = getelementptr double, double* %2, i64 %17
  %min.iters.check51 = icmp ult i64 %15, 4
  %min.iters.check = icmp ult i64 %11, 4
  %n.vec = and i64 %11, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %bound0 = icmp ult double* %scevgep, %scevgep39
  %bound1 = icmp ugt double* %scevgep37, %3
  %memcheck.conflict = and i1 %bound0, %bound1
  %ind.end = or i64 %n.vec, 1
  %cmp.n = icmp eq i64 %11, %n.vec
  %n.vec54 = and i64 %15, -4
  %cmp.zero55 = icmp eq i64 %n.vec54, 0
  %bound064 = icmp ult double* %scevgep57, %scevgep62
  %bound165 = icmp ugt double* %scevgep60, %2
  %memcheck.conflict67 = and i1 %bound064, %bound165
  %ind.end73 = or i64 %n.vec54, 1
  %cmp.n74 = icmp eq i64 %15, %n.vec54
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.preheader, %._crit_edge5.us
  %18 = phi i32 [ %44, %._crit_edge5.us ], [ 0, %._crit_edge.us.preheader ]
  br i1 %min.iters.check51, label %scalar.ph49.preheader, label %min.iters.checked52

scalar.ph49.preheader:                            ; preds = %middle.block48, %vector.memcheck68, %min.iters.checked52, %._crit_edge.us
  %indvars.iv.ph = phi i64 [ 1, %vector.memcheck68 ], [ 1, %min.iters.checked52 ], [ 1, %._crit_edge.us ], [ %ind.end73, %middle.block48 ]
  br label %scalar.ph49

min.iters.checked52:                              ; preds = %._crit_edge.us
  br i1 %cmp.zero55, label %scalar.ph49.preheader, label %vector.memcheck68

vector.memcheck68:                                ; preds = %min.iters.checked52
  br i1 %memcheck.conflict67, label %scalar.ph49.preheader, label %vector.body47.preheader

vector.body47.preheader:                          ; preds = %vector.memcheck68
  br label %vector.body47

vector.body47:                                    ; preds = %vector.body47.preheader, %vector.body47
  %index70 = phi i64 [ %index.next71, %vector.body47 ], [ 0, %vector.body47.preheader ]
  %offset.idx75 = or i64 %index70, 1
  %19 = add nsw i64 %offset.idx75, -1
  %20 = getelementptr inbounds double, double* %2, i64 %19
  %21 = bitcast double* %20 to <2 x double>*
  %wide.load80 = load <2 x double>, <2 x double>* %21, align 8, !alias.scope !1
  %22 = getelementptr double, double* %20, i64 2
  %23 = bitcast double* %22 to <2 x double>*
  %wide.load81 = load <2 x double>, <2 x double>* %23, align 8, !alias.scope !1
  %24 = getelementptr inbounds double, double* %2, i64 %offset.idx75
  %25 = bitcast double* %24 to <2 x double>*
  %wide.load82 = load <2 x double>, <2 x double>* %25, align 8, !alias.scope !1
  %26 = getelementptr double, double* %24, i64 2
  %27 = bitcast double* %26 to <2 x double>*
  %wide.load83 = load <2 x double>, <2 x double>* %27, align 8, !alias.scope !1
  %28 = fadd <2 x double> %wide.load80, %wide.load82
  %29 = fadd <2 x double> %wide.load81, %wide.load83
  %30 = add nuw nsw i64 %offset.idx75, 1
  %31 = getelementptr inbounds double, double* %2, i64 %30
  %32 = bitcast double* %31 to <2 x double>*
  %wide.load84 = load <2 x double>, <2 x double>* %32, align 8, !alias.scope !1
  %33 = getelementptr double, double* %31, i64 2
  %34 = bitcast double* %33 to <2 x double>*
  %wide.load85 = load <2 x double>, <2 x double>* %34, align 8, !alias.scope !1
  %35 = fadd <2 x double> %28, %wide.load84
  %36 = fadd <2 x double> %29, %wide.load85
  %37 = fmul <2 x double> %35, <double 3.333300e-01, double 3.333300e-01>
  %38 = fmul <2 x double> %36, <double 3.333300e-01, double 3.333300e-01>
  %39 = getelementptr inbounds double, double* %3, i64 %offset.idx75
  %40 = bitcast double* %39 to <2 x double>*
  store <2 x double> %37, <2 x double>* %40, align 8, !alias.scope !4, !noalias !1
  %41 = getelementptr double, double* %39, i64 2
  %42 = bitcast double* %41 to <2 x double>*
  store <2 x double> %38, <2 x double>* %42, align 8, !alias.scope !4, !noalias !1
  %index.next71 = add i64 %index70, 4
  %43 = icmp eq i64 %index.next71, %n.vec54
  br i1 %43, label %middle.block48, label %vector.body47, !llvm.loop !6

middle.block48:                                   ; preds = %vector.body47
  br i1 %cmp.n74, label %.lr.ph4.us.preheader, label %scalar.ph49.preheader

._crit_edge5.us.loopexit:                         ; preds = %.lr.ph4.us
  br label %._crit_edge5.us

._crit_edge5.us:                                  ; preds = %._crit_edge5.us.loopexit, %middle.block
  %44 = add nsw i32 %18, 1
  %45 = icmp slt i32 %44, %0
  br i1 %45, label %._crit_edge.us, label %._crit_edge.lr.ph.split.loopexit

.lr.ph4.us:                                       ; preds = %.lr.ph4.us.preheader86, %.lr.ph4.us
  %indvars.iv25 = phi i64 [ %52, %.lr.ph4.us ], [ %indvars.iv25.ph, %.lr.ph4.us.preheader86 ]
  %46 = add nsw i64 %indvars.iv25, -1
  %47 = getelementptr inbounds double, double* %3, i64 %46
  %48 = load double, double* %47, align 8
  %49 = getelementptr inbounds double, double* %3, i64 %indvars.iv25
  %50 = load double, double* %49, align 8
  %51 = fadd double %48, %50
  %52 = add nuw nsw i64 %indvars.iv25, 1
  %53 = getelementptr inbounds double, double* %3, i64 %52
  %54 = load double, double* %53, align 8
  %55 = fadd double %51, %54
  %56 = fmul double %55, 3.333300e-01
  %57 = getelementptr inbounds double, double* %2, i64 %indvars.iv25
  store double %56, double* %57, align 8
  %58 = icmp slt i64 %52, %9
  br i1 %58, label %.lr.ph4.us, label %._crit_edge5.us.loopexit, !llvm.loop !9

scalar.ph49:                                      ; preds = %scalar.ph49.preheader, %scalar.ph49
  %indvars.iv = phi i64 [ %65, %scalar.ph49 ], [ %indvars.iv.ph, %scalar.ph49.preheader ]
  %59 = add nsw i64 %indvars.iv, -1
  %60 = getelementptr inbounds double, double* %2, i64 %59
  %61 = load double, double* %60, align 8
  %62 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  %63 = load double, double* %62, align 8
  %64 = fadd double %61, %63
  %65 = add nuw nsw i64 %indvars.iv, 1
  %66 = getelementptr inbounds double, double* %2, i64 %65
  %67 = load double, double* %66, align 8
  %68 = fadd double %64, %67
  %69 = fmul double %68, 3.333300e-01
  %70 = getelementptr inbounds double, double* %3, i64 %indvars.iv
  store double %69, double* %70, align 8
  %71 = icmp slt i64 %65, %9
  br i1 %71, label %scalar.ph49, label %.lr.ph4.us.preheader.loopexit, !llvm.loop !10

.lr.ph4.us.preheader.loopexit:                    ; preds = %scalar.ph49
  br label %.lr.ph4.us.preheader

.lr.ph4.us.preheader:                             ; preds = %.lr.ph4.us.preheader.loopexit, %middle.block48
  br i1 %min.iters.check, label %.lr.ph4.us.preheader86, label %min.iters.checked

.lr.ph4.us.preheader86:                           ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph4.us.preheader
  %indvars.iv25.ph = phi i64 [ 1, %vector.memcheck ], [ 1, %min.iters.checked ], [ 1, %.lr.ph4.us.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph4.us

min.iters.checked:                                ; preds = %.lr.ph4.us.preheader
  br i1 %cmp.zero, label %.lr.ph4.us.preheader86, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  br i1 %memcheck.conflict, label %.lr.ph4.us.preheader86, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %72 = add nsw i64 %offset.idx, -1
  %73 = getelementptr inbounds double, double* %3, i64 %72
  %74 = bitcast double* %73 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %74, align 8, !alias.scope !11
  %75 = getelementptr double, double* %73, i64 2
  %76 = bitcast double* %75 to <2 x double>*
  %wide.load42 = load <2 x double>, <2 x double>* %76, align 8, !alias.scope !11
  %77 = getelementptr inbounds double, double* %3, i64 %offset.idx
  %78 = bitcast double* %77 to <2 x double>*
  %wide.load43 = load <2 x double>, <2 x double>* %78, align 8, !alias.scope !11
  %79 = getelementptr double, double* %77, i64 2
  %80 = bitcast double* %79 to <2 x double>*
  %wide.load44 = load <2 x double>, <2 x double>* %80, align 8, !alias.scope !11
  %81 = fadd <2 x double> %wide.load, %wide.load43
  %82 = fadd <2 x double> %wide.load42, %wide.load44
  %83 = add nuw nsw i64 %offset.idx, 1
  %84 = getelementptr inbounds double, double* %3, i64 %83
  %85 = bitcast double* %84 to <2 x double>*
  %wide.load45 = load <2 x double>, <2 x double>* %85, align 8, !alias.scope !11
  %86 = getelementptr double, double* %84, i64 2
  %87 = bitcast double* %86 to <2 x double>*
  %wide.load46 = load <2 x double>, <2 x double>* %87, align 8, !alias.scope !11
  %88 = fadd <2 x double> %81, %wide.load45
  %89 = fadd <2 x double> %82, %wide.load46
  %90 = fmul <2 x double> %88, <double 3.333300e-01, double 3.333300e-01>
  %91 = fmul <2 x double> %89, <double 3.333300e-01, double 3.333300e-01>
  %92 = getelementptr inbounds double, double* %2, i64 %offset.idx
  %93 = bitcast double* %92 to <2 x double>*
  store <2 x double> %90, <2 x double>* %93, align 8, !alias.scope !14, !noalias !11
  %94 = getelementptr double, double* %92, i64 2
  %95 = bitcast double* %94 to <2 x double>*
  store <2 x double> %91, <2 x double>* %95, align 8, !alias.scope !14, !noalias !11
  %index.next = add i64 %index, 4
  %96 = icmp eq i64 %index.next, %n.vec
  br i1 %96, label %middle.block, label %vector.body, !llvm.loop !16

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge5.us, label %.lr.ph4.us.preheader86

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
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.lr.ph, label %.loopexit

.lr.ph:                                           ; preds = %2
  %8 = sext i32 %0 to i64
  br label %9

; <label>:9:                                      ; preds = %.lr.ph, %._crit_edge
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge ]
  %10 = trunc i64 %indvars.iv to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %9
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %9, %13
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #6
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %19 = icmp slt i64 %indvars.iv.next, %8
  br i1 %19, label %9, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %._crit_edge
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %2
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
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
!10 = distinct !{!10, !7, !8}
!11 = !{!12}
!12 = distinct !{!12, !13}
!13 = distinct !{!13, !"LVerDomain"}
!14 = !{!15}
!15 = distinct !{!15, !13}
!16 = distinct !{!16, !7, !8}
