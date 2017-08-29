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
  %5 = bitcast i8* %3 to double*
  %6 = bitcast i8* %4 to double*
  tail call fastcc void @init_array(i32 2000, double* %5, double* %6)
  tail call void (...) @polybench_timer_start() #4
  %7 = bitcast i8* %3 to double*
  %8 = bitcast i8* %4 to double*
  tail call fastcc void @kernel_jacobi_1d(i32 500, i32 2000, double* %7, double* %8)
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
  tail call fastcc void @print_array(i32 2000, double* %14)
  br label %._crit_edge

._crit_edge:                                      ; preds = %10, %2, %13
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, double*, double*) unnamed_addr #2 {
  %4 = icmp sgt i32 %0, 0
  br i1 %4, label %.lr.ph, label %._crit_edge1

.lr.ph:                                           ; preds = %3
  %5 = sitofp i32 %0 to double
  %6 = sext i32 %0 to i64
  %7 = insertelement <2 x double> undef, double %5, i32 0
  %8 = shufflevector <2 x double> %7, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge2, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge2 ]
  %9 = trunc i64 %indvars.iv to i32
  %10 = sitofp i32 %9 to double
  %11 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %12 = insertelement <2 x double> undef, double %10, i32 0
  %13 = shufflevector <2 x double> %12, <2 x double> undef, <2 x i32> zeroinitializer
  %14 = fadd <2 x double> %13, <double 2.000000e+00, double 3.000000e+00>
  %15 = fdiv <2 x double> %14, %8
  %16 = extractelement <2 x double> %15, i32 0
  %17 = extractelement <2 x double> %15, i32 1
  store double %16, double* %11, align 8
  %18 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  store double %17, double* %18, align 8
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %19 = icmp slt i64 %indvars.iv.next, %6
  br i1 %19, label %._crit_edge2, label %._crit_edge1.loopexit

._crit_edge1.loopexit:                            ; preds = %._crit_edge2
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge1.loopexit, %3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_1d(i32, i32, double*, double*) unnamed_addr #2 {
  %5 = icmp sgt i32 %0, 0
  br i1 %5, label %._crit_edge.lr.ph, label %._crit_edge

._crit_edge.lr.ph:                                ; preds = %4
  %6 = add nsw i32 %1, -1
  %7 = icmp sgt i32 %6, 1
  %8 = sext i32 %1 to i64
  %9 = add nsw i64 %8, -1
  br i1 %7, label %.lr.ph.us.preheader, label %._crit_edge

.lr.ph.us.preheader:                              ; preds = %._crit_edge.lr.ph
  %10 = icmp sgt i64 %9, 2
  %smax = select i1 %10, i64 %9, i64 2
  %11 = add nsw i64 %smax, -1
  %scevgep = getelementptr double, double* %2, i64 1
  %12 = icmp sgt i64 %9, 2
  %smax38 = select i1 %12, i64 %9, i64 2
  %scevgep39 = getelementptr double, double* %2, i64 %smax38
  %13 = add nuw nsw i64 %smax38, 1
  %scevgep41 = getelementptr double, double* %3, i64 %13
  %14 = icmp sgt i64 %9, 2
  %smax52 = select i1 %14, i64 %9, i64 2
  %15 = add nsw i64 %smax52, -1
  %scevgep59 = getelementptr double, double* %3, i64 1
  %16 = icmp sgt i64 %9, 2
  %smax61 = select i1 %16, i64 %9, i64 2
  %scevgep62 = getelementptr double, double* %3, i64 %smax61
  %17 = add nuw nsw i64 %smax61, 1
  %scevgep64 = getelementptr double, double* %2, i64 %17
  %min.iters.check53 = icmp ult i64 %15, 4
  %min.iters.check = icmp ult i64 %11, 4
  %n.vec = and i64 %11, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %bound0 = icmp ult double* %scevgep, %scevgep41
  %bound1 = icmp ugt double* %scevgep39, %3
  %memcheck.conflict = and i1 %bound0, %bound1
  %ind.end = or i64 %n.vec, 1
  %cmp.n = icmp eq i64 %11, %n.vec
  %n.vec56 = and i64 %15, -4
  %cmp.zero57 = icmp eq i64 %n.vec56, 0
  %bound066 = icmp ult double* %scevgep59, %scevgep64
  %bound167 = icmp ugt double* %scevgep62, %2
  %memcheck.conflict69 = and i1 %bound066, %bound167
  %ind.end75 = or i64 %n.vec56, 1
  %cmp.n76 = icmp eq i64 %15, %n.vec56
  br label %.lr.ph.us

.lr.ph4.us.preheader.loopexit:                    ; preds = %._crit_edge33
  br label %.lr.ph4.us.preheader

.lr.ph4.us.preheader:                             ; preds = %.lr.ph4.us.preheader.loopexit, %middle.block50
  br i1 %min.iters.check, label %.lr.ph4.us.preheader88, label %min.iters.checked

.lr.ph4.us.preheader88:                           ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph4.us.preheader
  %indvars.iv25.ph = phi i64 [ 1, %vector.memcheck ], [ 1, %min.iters.checked ], [ 1, %.lr.ph4.us.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph4.us

min.iters.checked:                                ; preds = %.lr.ph4.us.preheader
  br i1 %cmp.zero, label %.lr.ph4.us.preheader88, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  br i1 %memcheck.conflict, label %.lr.ph4.us.preheader88, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %18 = add nsw i64 %offset.idx, -1
  %19 = getelementptr inbounds double, double* %3, i64 %18
  %20 = bitcast double* %19 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %20, align 8, !alias.scope !1
  %21 = getelementptr double, double* %19, i64 2
  %22 = bitcast double* %21 to <2 x double>*
  %wide.load44 = load <2 x double>, <2 x double>* %22, align 8, !alias.scope !1
  %23 = getelementptr inbounds double, double* %3, i64 %offset.idx
  %24 = bitcast double* %23 to <2 x double>*
  %wide.load45 = load <2 x double>, <2 x double>* %24, align 8, !alias.scope !1
  %25 = getelementptr double, double* %23, i64 2
  %26 = bitcast double* %25 to <2 x double>*
  %wide.load46 = load <2 x double>, <2 x double>* %26, align 8, !alias.scope !1
  %27 = fadd <2 x double> %wide.load, %wide.load45
  %28 = fadd <2 x double> %wide.load44, %wide.load46
  %29 = add nuw nsw i64 %offset.idx, 1
  %30 = getelementptr inbounds double, double* %3, i64 %29
  %31 = bitcast double* %30 to <2 x double>*
  %wide.load47 = load <2 x double>, <2 x double>* %31, align 8, !alias.scope !1
  %32 = getelementptr double, double* %30, i64 2
  %33 = bitcast double* %32 to <2 x double>*
  %wide.load48 = load <2 x double>, <2 x double>* %33, align 8, !alias.scope !1
  %34 = fadd <2 x double> %27, %wide.load47
  %35 = fadd <2 x double> %28, %wide.load48
  %36 = fmul <2 x double> %34, <double 3.333300e-01, double 3.333300e-01>
  %37 = fmul <2 x double> %35, <double 3.333300e-01, double 3.333300e-01>
  %38 = getelementptr inbounds double, double* %2, i64 %offset.idx
  %39 = bitcast double* %38 to <2 x double>*
  store <2 x double> %36, <2 x double>* %39, align 8, !alias.scope !4, !noalias !1
  %40 = getelementptr double, double* %38, i64 2
  %41 = bitcast double* %40 to <2 x double>*
  store <2 x double> %37, <2 x double>* %41, align 8, !alias.scope !4, !noalias !1
  %index.next = add i64 %index, 4
  %42 = icmp eq i64 %index.next, %n.vec
  br i1 %42, label %middle.block, label %vector.body, !llvm.loop !6

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge3.us._crit_edge, label %.lr.ph4.us.preheader88

._crit_edge3.us._crit_edge.loopexit:              ; preds = %.lr.ph4.us
  br label %._crit_edge3.us._crit_edge

._crit_edge3.us._crit_edge:                       ; preds = %._crit_edge3.us._crit_edge.loopexit, %middle.block
  %43 = add nsw i32 %69, 1
  %44 = icmp slt i32 %43, %0
  br i1 %44, label %.lr.ph.us, label %._crit_edge.loopexit

.lr.ph4.us:                                       ; preds = %.lr.ph4.us.preheader88, %.lr.ph4.us
  %indvars.iv25 = phi i64 [ %indvars.iv.next26, %.lr.ph4.us ], [ %indvars.iv25.ph, %.lr.ph4.us.preheader88 ]
  %45 = add nsw i64 %indvars.iv25, -1
  %46 = getelementptr inbounds double, double* %3, i64 %45
  %47 = load double, double* %46, align 8
  %48 = getelementptr inbounds double, double* %3, i64 %indvars.iv25
  %49 = load double, double* %48, align 8
  %50 = fadd double %47, %49
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %51 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next26
  %52 = load double, double* %51, align 8
  %53 = fadd double %50, %52
  %54 = fmul double %53, 3.333300e-01
  %55 = getelementptr inbounds double, double* %2, i64 %indvars.iv25
  store double %54, double* %55, align 8
  %56 = icmp slt i64 %indvars.iv.next26, %9
  br i1 %56, label %.lr.ph4.us, label %._crit_edge3.us._crit_edge.loopexit, !llvm.loop !9

._crit_edge33:                                    ; preds = %._crit_edge33.preheader, %._crit_edge33
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge33 ], [ %indvars.iv.ph, %._crit_edge33.preheader ]
  %57 = add nsw i64 %indvars.iv, -1
  %58 = getelementptr inbounds double, double* %2, i64 %57
  %59 = load double, double* %58, align 8
  %60 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  %61 = load double, double* %60, align 8
  %62 = fadd double %59, %61
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %63 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next
  %64 = load double, double* %63, align 8
  %65 = fadd double %62, %64
  %66 = fmul double %65, 3.333300e-01
  %67 = getelementptr inbounds double, double* %3, i64 %indvars.iv
  store double %66, double* %67, align 8
  %68 = icmp slt i64 %indvars.iv.next, %9
  br i1 %68, label %._crit_edge33, label %.lr.ph4.us.preheader.loopexit, !llvm.loop !10

.lr.ph.us:                                        ; preds = %.lr.ph.us.preheader, %._crit_edge3.us._crit_edge
  %69 = phi i32 [ %43, %._crit_edge3.us._crit_edge ], [ 0, %.lr.ph.us.preheader ]
  br i1 %min.iters.check53, label %._crit_edge33.preheader, label %min.iters.checked54

._crit_edge33.preheader:                          ; preds = %middle.block50, %vector.memcheck70, %min.iters.checked54, %.lr.ph.us
  %indvars.iv.ph = phi i64 [ 1, %vector.memcheck70 ], [ 1, %min.iters.checked54 ], [ 1, %.lr.ph.us ], [ %ind.end75, %middle.block50 ]
  br label %._crit_edge33

min.iters.checked54:                              ; preds = %.lr.ph.us
  br i1 %cmp.zero57, label %._crit_edge33.preheader, label %vector.memcheck70

vector.memcheck70:                                ; preds = %min.iters.checked54
  br i1 %memcheck.conflict69, label %._crit_edge33.preheader, label %vector.body49.preheader

vector.body49.preheader:                          ; preds = %vector.memcheck70
  br label %vector.body49

vector.body49:                                    ; preds = %vector.body49.preheader, %vector.body49
  %index72 = phi i64 [ %index.next73, %vector.body49 ], [ 0, %vector.body49.preheader ]
  %offset.idx77 = or i64 %index72, 1
  %70 = add nsw i64 %offset.idx77, -1
  %71 = getelementptr inbounds double, double* %2, i64 %70
  %72 = bitcast double* %71 to <2 x double>*
  %wide.load82 = load <2 x double>, <2 x double>* %72, align 8, !alias.scope !11
  %73 = getelementptr double, double* %71, i64 2
  %74 = bitcast double* %73 to <2 x double>*
  %wide.load83 = load <2 x double>, <2 x double>* %74, align 8, !alias.scope !11
  %75 = getelementptr inbounds double, double* %2, i64 %offset.idx77
  %76 = bitcast double* %75 to <2 x double>*
  %wide.load84 = load <2 x double>, <2 x double>* %76, align 8, !alias.scope !11
  %77 = getelementptr double, double* %75, i64 2
  %78 = bitcast double* %77 to <2 x double>*
  %wide.load85 = load <2 x double>, <2 x double>* %78, align 8, !alias.scope !11
  %79 = fadd <2 x double> %wide.load82, %wide.load84
  %80 = fadd <2 x double> %wide.load83, %wide.load85
  %81 = add nuw nsw i64 %offset.idx77, 1
  %82 = getelementptr inbounds double, double* %2, i64 %81
  %83 = bitcast double* %82 to <2 x double>*
  %wide.load86 = load <2 x double>, <2 x double>* %83, align 8, !alias.scope !11
  %84 = getelementptr double, double* %82, i64 2
  %85 = bitcast double* %84 to <2 x double>*
  %wide.load87 = load <2 x double>, <2 x double>* %85, align 8, !alias.scope !11
  %86 = fadd <2 x double> %79, %wide.load86
  %87 = fadd <2 x double> %80, %wide.load87
  %88 = fmul <2 x double> %86, <double 3.333300e-01, double 3.333300e-01>
  %89 = fmul <2 x double> %87, <double 3.333300e-01, double 3.333300e-01>
  %90 = getelementptr inbounds double, double* %3, i64 %offset.idx77
  %91 = bitcast double* %90 to <2 x double>*
  store <2 x double> %88, <2 x double>* %91, align 8, !alias.scope !14, !noalias !11
  %92 = getelementptr double, double* %90, i64 2
  %93 = bitcast double* %92 to <2 x double>*
  store <2 x double> %89, <2 x double>* %93, align 8, !alias.scope !14, !noalias !11
  %index.next73 = add i64 %index72, 4
  %94 = icmp eq i64 %index.next73, %n.vec56
  br i1 %94, label %middle.block50, label %vector.body49, !llvm.loop !16

middle.block50:                                   ; preds = %vector.body49
  br i1 %cmp.n76, label %.lr.ph4.us.preheader, label %._crit_edge33.preheader

._crit_edge.loopexit:                             ; preds = %._crit_edge3.us._crit_edge
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %._crit_edge.lr.ph, %4
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
  br i1 %7, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %2
  %8 = sext i32 %0 to i64
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge3, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge3 ]
  %9 = trunc i64 %indvars.iv to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge3

; <label>:12:                                     ; preds = %._crit_edge4
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge4, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %18 = icmp slt i64 %indvars.iv.next, %8
  br i1 %18, label %._crit_edge4, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %._crit_edge3
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
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
