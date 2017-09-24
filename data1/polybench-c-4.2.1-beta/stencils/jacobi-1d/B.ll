; ModuleID = 'A.ll'
source_filename = "jacobi-1d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %4 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %5 = bitcast i8* %3 to double*
  %6 = bitcast i8* %4 to double*
  call void @init_array(i32 2000, double* %5, double* %6)
  call void (...) @polybench_timer_start() #4
  %7 = bitcast i8* %3 to double*
  %8 = bitcast i8* %4 to double*
  call void @kernel_jacobi_1d(i32 500, i32 2000, double* %7, double* %8)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %15

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %10
  %14 = bitcast i8* %3 to double*
  call void @print_array(i32 2000, double* %14)
  br label %15

; <label>:15:                                     ; preds = %10, %13, %2
  call void @free(i8* %3) #4
  call void @free(i8* %4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, double*, double*) #2 {
  %4 = icmp sgt i32 %0, 0
  br i1 %4, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %3
  %5 = sitofp i32 %0 to double
  %6 = sext i32 %0 to i64
  %min.iters.check = icmp eq i32 %0, 1
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph
  %n.vec = and i64 %6, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep = getelementptr double, double* %1, i64 %6
  %scevgep2 = getelementptr double, double* %2, i64 %6
  %bound0 = icmp ugt double* %scevgep2, %1
  %bound1 = icmp ugt double* %scevgep, %2
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %scalar.ph.preheader, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %broadcast.splatinsert = insertelement <2 x double> undef, double %5, i32 0
  %broadcast.splat = shufflevector <2 x double> %broadcast.splatinsert, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind4 = phi <2 x i32> [ <i32 0, i32 1>, %vector.ph ], [ %vec.ind.next5, %vector.body ]
  %7 = sitofp <2 x i32> %vec.ind4 to <2 x double>
  %8 = fadd <2 x double> %7, <double 2.000000e+00, double 2.000000e+00>
  %9 = fdiv <2 x double> %8, %broadcast.splat
  %10 = getelementptr inbounds double, double* %1, i64 %index
  %11 = bitcast double* %10 to <2 x double>*
  store <2 x double> %9, <2 x double>* %11, align 8, !alias.scope !1, !noalias !4
  %12 = fadd <2 x double> %7, <double 3.000000e+00, double 3.000000e+00>
  %13 = fdiv <2 x double> %12, %broadcast.splat
  %14 = getelementptr inbounds double, double* %2, i64 %index
  %15 = bitcast double* %14 to <2 x double>*
  store <2 x double> %13, <2 x double>* %15, align 8, !alias.scope !4
  %index.next = add i64 %index, 2
  %vec.ind.next5 = add <2 x i32> %vec.ind4, <i32 2, i32 2>
  %16 = icmp eq i64 %index.next, %n.vec
  br i1 %16, label %middle.block, label %vector.body, !llvm.loop !6

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %6, %n.vec
  br i1 %cmp.n, label %._crit_edge, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.lr.ph ], [ %n.vec, %middle.block ]
  %17 = insertelement <2 x double> undef, double %5, i32 0
  %18 = shufflevector <2 x double> %17, <2 x double> undef, <2 x i32> zeroinitializer
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph ], [ %indvars.iv.ph, %scalar.ph.preheader ]
  %19 = trunc i64 %indvars.iv to i32
  %20 = sitofp i32 %19 to double
  %21 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %22 = insertelement <2 x double> undef, double %20, i32 0
  %23 = shufflevector <2 x double> %22, <2 x double> undef, <2 x i32> zeroinitializer
  %24 = fadd <2 x double> %23, <double 2.000000e+00, double 3.000000e+00>
  %25 = fdiv <2 x double> %24, %18
  %26 = extractelement <2 x double> %25, i32 0
  %27 = extractelement <2 x double> %25, i32 1
  store double %26, double* %21, align 8
  %28 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  store double %27, double* %28, align 8
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %29 = icmp slt i64 %indvars.iv.next, %6
  br i1 %29, label %scalar.ph, label %._crit_edge.loopexit, !llvm.loop !9

._crit_edge.loopexit:                             ; preds = %scalar.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %middle.block, %3
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_jacobi_1d(i32, i32, double*, double*) #2 {
  %5 = icmp sgt i32 %0, 0
  br i1 %5, label %.preheader3.lr.ph, label %._crit_edge7

.preheader3.lr.ph:                                ; preds = %4
  %6 = add nsw i32 %1, -1
  %7 = icmp sgt i32 %6, 1
  br i1 %7, label %.preheader3.us.preheader, label %._crit_edge7

.preheader3.us.preheader:                         ; preds = %.preheader3.lr.ph
  %8 = sext i32 %6 to i64
  %9 = add nsw i64 %8, -1
  %scevgep57 = getelementptr double, double* %2, i64 1
  %scevgep59 = getelementptr double, double* %2, i64 %8
  %10 = add nsw i64 %8, 1
  %scevgep61 = getelementptr double, double* %3, i64 %10
  %11 = add nsw i64 %8, -1
  %scevgep94 = getelementptr double, double* %3, i64 1
  %scevgep96 = getelementptr double, double* %3, i64 %8
  %12 = add nsw i64 %8, 1
  %scevgep98 = getelementptr double, double* %2, i64 %12
  %min.iters.check88 = icmp ult i64 %11, 4
  %min.iters.check51 = icmp ult i64 %9, 4
  %n.vec54 = and i64 %9, -4
  %cmp.zero55 = icmp eq i64 %n.vec54, 0
  %bound063 = icmp ult double* %scevgep57, %scevgep61
  %bound164 = icmp ugt double* %scevgep59, %3
  %memcheck.conflict66 = and i1 %bound063, %bound164
  %ind.end72 = or i64 %n.vec54, 1
  %cmp.n73 = icmp eq i64 %9, %n.vec54
  %n.vec91 = and i64 %11, -4
  %cmp.zero92 = icmp eq i64 %n.vec91, 0
  %bound0100 = icmp ult double* %scevgep94, %scevgep98
  %bound1101 = icmp ugt double* %scevgep96, %2
  %memcheck.conflict103 = and i1 %bound0100, %bound1101
  %ind.end109 = or i64 %n.vec91, 1
  %cmp.n110 = icmp eq i64 %11, %n.vec91
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %.preheader3.us.preheader, %._crit_edge.us
  %13 = phi i32 [ %39, %._crit_edge.us ], [ 0, %.preheader3.us.preheader ]
  br i1 %min.iters.check88, label %scalar.ph87.preheader, label %min.iters.checked89

scalar.ph87.preheader:                            ; preds = %middle.block86, %vector.memcheck104, %min.iters.checked89, %.preheader3.us
  %indvars.iv.ph = phi i64 [ 1, %vector.memcheck104 ], [ 1, %min.iters.checked89 ], [ 1, %.preheader3.us ], [ %ind.end109, %middle.block86 ]
  br label %scalar.ph87

min.iters.checked89:                              ; preds = %.preheader3.us
  br i1 %cmp.zero92, label %scalar.ph87.preheader, label %vector.memcheck104

vector.memcheck104:                               ; preds = %min.iters.checked89
  br i1 %memcheck.conflict103, label %scalar.ph87.preheader, label %vector.body85.preheader

vector.body85.preheader:                          ; preds = %vector.memcheck104
  br label %vector.body85

vector.body85:                                    ; preds = %vector.body85.preheader, %vector.body85
  %index106 = phi i64 [ %index.next107, %vector.body85 ], [ 0, %vector.body85.preheader ]
  %offset.idx111 = or i64 %index106, 1
  %14 = add nsw i64 %offset.idx111, -1
  %15 = getelementptr inbounds double, double* %2, i64 %14
  %16 = bitcast double* %15 to <2 x double>*
  %wide.load116 = load <2 x double>, <2 x double>* %16, align 8, !alias.scope !10
  %17 = getelementptr double, double* %15, i64 2
  %18 = bitcast double* %17 to <2 x double>*
  %wide.load117 = load <2 x double>, <2 x double>* %18, align 8, !alias.scope !10
  %19 = getelementptr inbounds double, double* %2, i64 %offset.idx111
  %20 = bitcast double* %19 to <2 x double>*
  %wide.load118 = load <2 x double>, <2 x double>* %20, align 8, !alias.scope !10
  %21 = getelementptr double, double* %19, i64 2
  %22 = bitcast double* %21 to <2 x double>*
  %wide.load119 = load <2 x double>, <2 x double>* %22, align 8, !alias.scope !10
  %23 = fadd <2 x double> %wide.load116, %wide.load118
  %24 = fadd <2 x double> %wide.load117, %wide.load119
  %25 = add nuw nsw i64 %offset.idx111, 1
  %26 = getelementptr inbounds double, double* %2, i64 %25
  %27 = bitcast double* %26 to <2 x double>*
  %wide.load120 = load <2 x double>, <2 x double>* %27, align 8, !alias.scope !10
  %28 = getelementptr double, double* %26, i64 2
  %29 = bitcast double* %28 to <2 x double>*
  %wide.load121 = load <2 x double>, <2 x double>* %29, align 8, !alias.scope !10
  %30 = fadd <2 x double> %23, %wide.load120
  %31 = fadd <2 x double> %24, %wide.load121
  %32 = fmul <2 x double> %30, <double 3.333300e-01, double 3.333300e-01>
  %33 = fmul <2 x double> %31, <double 3.333300e-01, double 3.333300e-01>
  %34 = getelementptr inbounds double, double* %3, i64 %offset.idx111
  %35 = bitcast double* %34 to <2 x double>*
  store <2 x double> %32, <2 x double>* %35, align 8, !alias.scope !13, !noalias !10
  %36 = getelementptr double, double* %34, i64 2
  %37 = bitcast double* %36 to <2 x double>*
  store <2 x double> %33, <2 x double>* %37, align 8, !alias.scope !13, !noalias !10
  %index.next107 = add i64 %index106, 4
  %38 = icmp eq i64 %index.next107, %n.vec91
  br i1 %38, label %middle.block86, label %vector.body85, !llvm.loop !15

middle.block86:                                   ; preds = %vector.body85
  br i1 %cmp.n110, label %.lr.ph4.us.preheader, label %scalar.ph87.preheader

._crit_edge.us.loopexit:                          ; preds = %.lr.ph4.us
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block49
  %39 = add nsw i32 %13, 1
  %40 = icmp slt i32 %39, %0
  br i1 %40, label %.preheader3.us, label %._crit_edge7.loopexit

.lr.ph4.us:                                       ; preds = %.lr.ph4.us.preheader122, %.lr.ph4.us
  %indvars.iv24 = phi i64 [ %indvars.iv.next25, %.lr.ph4.us ], [ %indvars.iv24.ph, %.lr.ph4.us.preheader122 ]
  %41 = add nsw i64 %indvars.iv24, -1
  %42 = getelementptr inbounds double, double* %3, i64 %41
  %43 = load double, double* %42, align 8
  %44 = getelementptr inbounds double, double* %3, i64 %indvars.iv24
  %45 = load double, double* %44, align 8
  %46 = fadd double %43, %45
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %47 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next25
  %48 = load double, double* %47, align 8
  %49 = fadd double %46, %48
  %50 = fmul double %49, 3.333300e-01
  %51 = getelementptr inbounds double, double* %2, i64 %indvars.iv24
  store double %50, double* %51, align 8
  %52 = icmp slt i64 %indvars.iv.next25, %8
  br i1 %52, label %.lr.ph4.us, label %._crit_edge.us.loopexit, !llvm.loop !16

scalar.ph87:                                      ; preds = %scalar.ph87.preheader, %scalar.ph87
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph87 ], [ %indvars.iv.ph, %scalar.ph87.preheader ]
  %53 = add nsw i64 %indvars.iv, -1
  %54 = getelementptr inbounds double, double* %2, i64 %53
  %55 = load double, double* %54, align 8
  %56 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  %57 = load double, double* %56, align 8
  %58 = fadd double %55, %57
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %59 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next
  %60 = load double, double* %59, align 8
  %61 = fadd double %58, %60
  %62 = fmul double %61, 3.333300e-01
  %63 = getelementptr inbounds double, double* %3, i64 %indvars.iv
  store double %62, double* %63, align 8
  %64 = icmp slt i64 %indvars.iv.next, %8
  br i1 %64, label %scalar.ph87, label %.lr.ph4.us.preheader.loopexit, !llvm.loop !17

.lr.ph4.us.preheader.loopexit:                    ; preds = %scalar.ph87
  br label %.lr.ph4.us.preheader

.lr.ph4.us.preheader:                             ; preds = %.lr.ph4.us.preheader.loopexit, %middle.block86
  br i1 %min.iters.check51, label %.lr.ph4.us.preheader122, label %min.iters.checked52

.lr.ph4.us.preheader122:                          ; preds = %middle.block49, %vector.memcheck67, %min.iters.checked52, %.lr.ph4.us.preheader
  %indvars.iv24.ph = phi i64 [ 1, %vector.memcheck67 ], [ 1, %min.iters.checked52 ], [ 1, %.lr.ph4.us.preheader ], [ %ind.end72, %middle.block49 ]
  br label %.lr.ph4.us

min.iters.checked52:                              ; preds = %.lr.ph4.us.preheader
  br i1 %cmp.zero55, label %.lr.ph4.us.preheader122, label %vector.memcheck67

vector.memcheck67:                                ; preds = %min.iters.checked52
  br i1 %memcheck.conflict66, label %.lr.ph4.us.preheader122, label %vector.body48.preheader

vector.body48.preheader:                          ; preds = %vector.memcheck67
  br label %vector.body48

vector.body48:                                    ; preds = %vector.body48.preheader, %vector.body48
  %index69 = phi i64 [ %index.next70, %vector.body48 ], [ 0, %vector.body48.preheader ]
  %offset.idx74 = or i64 %index69, 1
  %65 = add nsw i64 %offset.idx74, -1
  %66 = getelementptr inbounds double, double* %3, i64 %65
  %67 = bitcast double* %66 to <2 x double>*
  %wide.load79 = load <2 x double>, <2 x double>* %67, align 8, !alias.scope !18
  %68 = getelementptr double, double* %66, i64 2
  %69 = bitcast double* %68 to <2 x double>*
  %wide.load80 = load <2 x double>, <2 x double>* %69, align 8, !alias.scope !18
  %70 = getelementptr inbounds double, double* %3, i64 %offset.idx74
  %71 = bitcast double* %70 to <2 x double>*
  %wide.load81 = load <2 x double>, <2 x double>* %71, align 8, !alias.scope !18
  %72 = getelementptr double, double* %70, i64 2
  %73 = bitcast double* %72 to <2 x double>*
  %wide.load82 = load <2 x double>, <2 x double>* %73, align 8, !alias.scope !18
  %74 = fadd <2 x double> %wide.load79, %wide.load81
  %75 = fadd <2 x double> %wide.load80, %wide.load82
  %76 = add nuw nsw i64 %offset.idx74, 1
  %77 = getelementptr inbounds double, double* %3, i64 %76
  %78 = bitcast double* %77 to <2 x double>*
  %wide.load83 = load <2 x double>, <2 x double>* %78, align 8, !alias.scope !18
  %79 = getelementptr double, double* %77, i64 2
  %80 = bitcast double* %79 to <2 x double>*
  %wide.load84 = load <2 x double>, <2 x double>* %80, align 8, !alias.scope !18
  %81 = fadd <2 x double> %74, %wide.load83
  %82 = fadd <2 x double> %75, %wide.load84
  %83 = fmul <2 x double> %81, <double 3.333300e-01, double 3.333300e-01>
  %84 = fmul <2 x double> %82, <double 3.333300e-01, double 3.333300e-01>
  %85 = getelementptr inbounds double, double* %2, i64 %offset.idx74
  %86 = bitcast double* %85 to <2 x double>*
  store <2 x double> %83, <2 x double>* %86, align 8, !alias.scope !21, !noalias !18
  %87 = getelementptr double, double* %85, i64 2
  %88 = bitcast double* %87 to <2 x double>*
  store <2 x double> %84, <2 x double>* %88, align 8, !alias.scope !21, !noalias !18
  %index.next70 = add i64 %index69, 4
  %89 = icmp eq i64 %index.next70, %n.vec54
  br i1 %89, label %middle.block49, label %vector.body48, !llvm.loop !23

middle.block49:                                   ; preds = %vector.body48
  br i1 %cmp.n73, label %._crit_edge.us, label %.lr.ph4.us.preheader122

._crit_edge7.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge7.loopexit, %.preheader3.lr.ph, %4
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, double*) #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %2
  %8 = sext i32 %0 to i64
  br label %9

; <label>:9:                                      ; preds = %.lr.ph, %15
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %15 ]
  %10 = trunc i64 %indvars.iv to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %9
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %15

; <label>:15:                                     ; preds = %13, %9
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %20 = icmp slt i64 %indvars.iv.next, %8
  br i1 %20, label %9, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %15
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #5
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
!17 = distinct !{!17, !7, !8}
!18 = !{!19}
!19 = distinct !{!19, !20}
!20 = distinct !{!20, !"LVerDomain"}
!21 = !{!22}
!22 = distinct !{!22, !20}
!23 = distinct !{!23, !7, !8}
