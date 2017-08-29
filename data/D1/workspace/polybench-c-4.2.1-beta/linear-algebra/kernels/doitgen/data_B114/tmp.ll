; ModuleID = 'A.ll'
source_filename = "doitgen.c"
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

; Function Attrs: noinline norecurse nounwind uwtable
define void @kernel_doitgen(i32, i32, i32, [140 x [160 x double]]*, [160 x double]*, double*) local_unnamed_addr #0 {
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.lr.ph11, label %.._crit_edge12_crit_edge

.._crit_edge12_crit_edge:                         ; preds = %6
  br label %._crit_edge12

.lr.ph11:                                         ; preds = %6
  %8 = sext i32 %2 to i64
  %9 = sext i32 %1 to i64
  %10 = sext i32 %0 to i64
  %xtraiter = and i32 %2, 1
  %wide.trip.count57 = zext i32 %2 to i64
  %scevgep79 = getelementptr double, double* %5, i64 %8
  %11 = add nsw i64 %9, -1
  %12 = icmp sgt i32 %1, 0
  %13 = icmp sgt i32 %2, 0
  %14 = icmp eq i32 %xtraiter, 0
  %15 = icmp eq i32 %2, 1
  %sunkaddr71 = ptrtoint double* %5 to i64
  %sunkaddr = ptrtoint double* %5 to i64
  %min.iters.check = icmp ult i32 %2, 4
  %n.vec = and i64 %8, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i64 %8, %n.vec
  br label %16

; <label>:16:                                     ; preds = %._crit_edge9._crit_edge, %.lr.ph11
  %indvars.iv63 = phi i64 [ 0, %.lr.ph11 ], [ %indvars.iv.next64, %._crit_edge9._crit_edge ]
  br i1 %12, label %.lr.ph8, label %.._crit_edge9_crit_edge

.._crit_edge9_crit_edge:                          ; preds = %16
  br label %._crit_edge9

.lr.ph8:                                          ; preds = %16
  br i1 %13, label %.lr.ph8..lr.ph8.split.us_crit_edge, label %.lr.ph8..lr.ph8.split_crit_edge

.lr.ph8..lr.ph8.split_crit_edge:                  ; preds = %.lr.ph8
  br label %.lr.ph8.split

.lr.ph8..lr.ph8.split.us_crit_edge:               ; preds = %.lr.ph8
  br label %.lr.ph8.split.us

.lr.ph8.split.us:                                 ; preds = %._crit_edge6.us..lr.ph8.split.us_crit_edge, %.lr.ph8..lr.ph8.split.us_crit_edge
  %indvars.iv61 = phi i64 [ %indvars.iv.next62, %._crit_edge6.us..lr.ph8.split.us_crit_edge ], [ 0, %.lr.ph8..lr.ph8.split.us_crit_edge ]
  %scevgep = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv63, i64 %indvars.iv61, i64 0
  %17 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv63, i64 %indvars.iv61, i64 0
  br label %.lr.ph.us.us

.lr.ph5.us.preheader:                             ; preds = %._crit_edge.us.us
  %scevgep77 = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv63, i64 %indvars.iv61, i64 %8
  br i1 %min.iters.check, label %.lr.ph5.us.preheader..lr.ph5.us_crit_edge, label %min.iters.checked

.lr.ph5.us.preheader..lr.ph5.us_crit_edge:        ; preds = %.lr.ph5.us.preheader
  br label %.lr.ph5.us.preheader115

min.iters.checked:                                ; preds = %.lr.ph5.us.preheader
  br i1 %cmp.zero, label %min.iters.checked..lr.ph5.us_crit_edge, label %vector.memcheck

min.iters.checked..lr.ph5.us_crit_edge:           ; preds = %min.iters.checked
  br label %.lr.ph5.us.preheader115

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep79
  %bound1 = icmp ugt double* %scevgep77, %5
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %vector.memcheck..lr.ph5.us_crit_edge, label %vector.memcheck.vector.body_crit_edge

vector.memcheck.vector.body_crit_edge:            ; preds = %vector.memcheck
  br label %vector.body

vector.memcheck..lr.ph5.us_crit_edge:             ; preds = %vector.memcheck
  br label %.lr.ph5.us.preheader115

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.memcheck.vector.body_crit_edge
  %index = phi i64 [ %index.next, %vector.body.vector.body_crit_edge ], [ 0, %vector.memcheck.vector.body_crit_edge ]
  %18 = getelementptr inbounds double, double* %5, i64 %index
  %19 = bitcast double* %18 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %19, align 8, !alias.scope !1
  %20 = getelementptr double, double* %18, i64 2
  %21 = bitcast double* %20 to <2 x i64>*
  %wide.load82 = load <2 x i64>, <2 x i64>* %21, align 8, !alias.scope !1
  %22 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv63, i64 %indvars.iv61, i64 %index
  %23 = bitcast double* %22 to <2 x i64>*
  store <2 x i64> %wide.load, <2 x i64>* %23, align 8, !alias.scope !4, !noalias !1
  %24 = getelementptr double, double* %22, i64 2
  %25 = bitcast double* %24 to <2 x i64>*
  store <2 x i64> %wide.load82, <2 x i64>* %25, align 8, !alias.scope !4, !noalias !1
  %index.next = add i64 %index, 4
  %26 = icmp eq i64 %index.next, %n.vec
  br i1 %26, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !6

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %middle.block.._crit_edge6.us_crit_edge, label %middle.block..lr.ph5.us_crit_edge

middle.block..lr.ph5.us_crit_edge:                ; preds = %middle.block
  br label %.lr.ph5.us.preheader115

.lr.ph5.us.preheader115:                          ; preds = %.lr.ph5.us.preheader..lr.ph5.us_crit_edge, %min.iters.checked..lr.ph5.us_crit_edge, %vector.memcheck..lr.ph5.us_crit_edge, %middle.block..lr.ph5.us_crit_edge
  %indvars.iv59.ph = phi i64 [ 0, %vector.memcheck..lr.ph5.us_crit_edge ], [ 0, %min.iters.checked..lr.ph5.us_crit_edge ], [ 0, %.lr.ph5.us.preheader..lr.ph5.us_crit_edge ], [ %n.vec, %middle.block..lr.ph5.us_crit_edge ]
  br label %.lr.ph5.us

middle.block.._crit_edge6.us_crit_edge:           ; preds = %middle.block
  br label %._crit_edge6.us

.lr.ph5.us:                                       ; preds = %.lr.ph5.us.preheader115, %.lr.ph5.us..lr.ph5.us_crit_edge
  %indvars.iv59 = phi i64 [ %indvars.iv.next60, %.lr.ph5.us..lr.ph5.us_crit_edge ], [ %indvars.iv59.ph, %.lr.ph5.us.preheader115 ]
  %27 = getelementptr inbounds double, double* %5, i64 %indvars.iv59
  %28 = bitcast double* %27 to i64*
  %29 = load i64, i64* %28, align 8
  %30 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv63, i64 %indvars.iv61, i64 %indvars.iv59
  %31 = bitcast double* %30 to i64*
  store i64 %29, i64* %31, align 8
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %32 = icmp slt i64 %indvars.iv.next60, %8
  br i1 %32, label %.lr.ph5.us..lr.ph5.us_crit_edge, label %.lr.ph5.us.._crit_edge6.us_crit_edge, !llvm.loop !9

.lr.ph5.us.._crit_edge6.us_crit_edge:             ; preds = %.lr.ph5.us
  br label %._crit_edge6.us

.lr.ph5.us..lr.ph5.us_crit_edge:                  ; preds = %.lr.ph5.us
  br label %.lr.ph5.us

._crit_edge6.us:                                  ; preds = %.lr.ph5.us.._crit_edge6.us_crit_edge, %middle.block.._crit_edge6.us_crit_edge
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %33 = icmp slt i64 %indvars.iv.next62, %9
  br i1 %33, label %._crit_edge6.us..lr.ph8.split.us_crit_edge, label %._crit_edge6.us.._crit_edge9_crit_edge

._crit_edge6.us.._crit_edge9_crit_edge:           ; preds = %._crit_edge6.us
  br label %._crit_edge9

._crit_edge6.us..lr.ph8.split.us_crit_edge:       ; preds = %._crit_edge6.us
  br label %.lr.ph8.split.us

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us..lr.ph.us.us_crit_edge, %.lr.ph8.split.us
  %indvars.iv55 = phi i64 [ %indvars.iv.next56, %._crit_edge.us.us..lr.ph.us.us_crit_edge ], [ 0, %.lr.ph8.split.us ]
  %34 = getelementptr inbounds double, double* %5, i64 %indvars.iv55
  store double 0.000000e+00, double* %34, align 8
  br i1 %14, label %.lr.ph.us.us..prol.loopexit_crit_edge, label %.prol.preheader

.lr.ph.us.us..prol.loopexit_crit_edge:            ; preds = %.lr.ph.us.us
  br label %.prol.loopexit

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %35 = load double, double* %17, align 8
  %36 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 0, i64 %indvars.iv55
  %37 = load double, double* %36, align 8
  %38 = fmul double %35, %37
  %sunkaddr68 = shl i64 %indvars.iv55, 3
  %sunkaddr69 = add i64 %sunkaddr, %sunkaddr68
  %sunkaddr70 = inttoptr i64 %sunkaddr69 to double*
  %39 = load double, double* %sunkaddr70, align 8
  %40 = fadd double %38, %39
  store double %40, double* %sunkaddr70, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph.us.us..prol.loopexit_crit_edge, %.prol.preheader
  %indvars.iv51.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us..prol.loopexit_crit_edge ]
  br i1 %15, label %.prol.loopexit.._crit_edge.us.us_crit_edge, label %.prol.loopexit..lr.ph.us.us.new_crit_edge

.prol.loopexit..lr.ph.us.us.new_crit_edge:        ; preds = %.prol.loopexit
  %sunkaddr72 = shl i64 %indvars.iv55, 3
  %sunkaddr73 = add i64 %sunkaddr71, %sunkaddr72
  %sunkaddr74 = inttoptr i64 %sunkaddr73 to double*
  br label %.lr.ph.us.us.new

.prol.loopexit.._crit_edge.us.us_crit_edge:       ; preds = %.prol.loopexit
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %.lr.ph.us.us.new.._crit_edge.us.us_crit_edge, %.prol.loopexit.._crit_edge.us.us_crit_edge
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %exitcond58 = icmp eq i64 %indvars.iv.next56, %wide.trip.count57
  br i1 %exitcond58, label %.lr.ph5.us.preheader, label %._crit_edge.us.us..lr.ph.us.us_crit_edge

._crit_edge.us.us..lr.ph.us.us_crit_edge:         ; preds = %._crit_edge.us.us
  br label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge, %.prol.loopexit..lr.ph.us.us.new_crit_edge
  %indvars.iv51 = phi i64 [ %indvars.iv.next52.1, %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge ], [ %indvars.iv51.unr.ph, %.prol.loopexit..lr.ph.us.us.new_crit_edge ]
  %41 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv63, i64 %indvars.iv61, i64 %indvars.iv51
  %42 = load double, double* %41, align 8
  %43 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv51, i64 %indvars.iv55
  %44 = load double, double* %43, align 8
  %45 = fmul double %42, %44
  %46 = load double, double* %sunkaddr74, align 8
  %47 = fadd double %45, %46
  store double %47, double* %sunkaddr74, align 8
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %48 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv63, i64 %indvars.iv61, i64 %indvars.iv.next52
  %49 = load double, double* %48, align 8
  %50 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv.next52, i64 %indvars.iv55
  %51 = load double, double* %50, align 8
  %52 = fmul double %49, %51
  %53 = fadd double %52, %47
  store double %53, double* %sunkaddr74, align 8
  %indvars.iv.next52.1 = add nsw i64 %indvars.iv51, 2
  %exitcond54.1 = icmp eq i64 %indvars.iv.next52.1, %wide.trip.count57
  br i1 %exitcond54.1, label %.lr.ph.us.us.new.._crit_edge.us.us_crit_edge, label %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge

.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge:      ; preds = %.lr.ph.us.us.new
  br label %.lr.ph.us.us.new

.lr.ph.us.us.new.._crit_edge.us.us_crit_edge:     ; preds = %.lr.ph.us.us.new
  br label %._crit_edge.us.us

.lr.ph8.split:                                    ; preds = %.lr.ph8.split..lr.ph8.split_crit_edge, %.lr.ph8..lr.ph8.split_crit_edge
  %indvars.iv47 = phi i64 [ %indvars.iv.next48, %.lr.ph8.split..lr.ph8.split_crit_edge ], [ 0, %.lr.ph8..lr.ph8.split_crit_edge ]
  %exitcond = icmp eq i64 %indvars.iv47, %11
  br i1 %exitcond, label %.lr.ph8.split.._crit_edge9_crit_edge, label %.lr.ph8.split..lr.ph8.split_crit_edge

.lr.ph8.split.._crit_edge9_crit_edge:             ; preds = %.lr.ph8.split
  br label %._crit_edge9

.lr.ph8.split..lr.ph8.split_crit_edge:            ; preds = %.lr.ph8.split
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  br label %.lr.ph8.split

._crit_edge9:                                     ; preds = %.lr.ph8.split.._crit_edge9_crit_edge, %._crit_edge6.us.._crit_edge9_crit_edge, %.._crit_edge9_crit_edge
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %54 = icmp slt i64 %indvars.iv.next64, %10
  br i1 %54, label %._crit_edge9._crit_edge, label %._crit_edge9.._crit_edge12_crit_edge

._crit_edge9.._crit_edge12_crit_edge:             ; preds = %._crit_edge9
  br label %._crit_edge12

._crit_edge9._crit_edge:                          ; preds = %._crit_edge9
  br label %16

._crit_edge12:                                    ; preds = %._crit_edge9.._crit_edge12_crit_edge, %.._crit_edge12_crit_edge
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #1 {
  %3 = call i8* @polybench_alloc_data(i64 3360000, i32 8) #4
  %4 = call i8* @polybench_alloc_data(i64 160, i32 8) #4
  %5 = call i8* @polybench_alloc_data(i64 25600, i32 8) #4
  %6 = bitcast i8* %3 to [140 x [160 x double]]*
  %7 = bitcast i8* %5 to [160 x double]*
  call fastcc void @init_array(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6, [160 x double]* %7)
  call void (...) @polybench_timer_start() #4
  %8 = bitcast i8* %4 to double*
  call void @kernel_doitgen(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6, [160 x double]* %7, double* %8)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %._crit_edge

._crit_edge:                                      ; preds = %2
  br label %14

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %._crit_edge1

._crit_edge1:                                     ; preds = %10
  br label %14

; <label>:13:                                     ; preds = %10
  call fastcc void @print_array(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6)
  br label %14

; <label>:14:                                     ; preds = %._crit_edge1, %._crit_edge, %13
  call void @free(i8* %3) #4
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #2

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, i32, [140 x [160 x double]]*, [160 x double]*) unnamed_addr #0 {
.lr.ph11:
  br label %.lr.ph11.split.us

.lr.ph11.split.us:                                ; preds = %._crit_edge9.us..lr.ph11.split.us_crit_edge, %.lr.ph11
  %indvars.iv57 = phi i64 [ 0, %.lr.ph11 ], [ %indvars.iv.next58, %._crit_edge9.us..lr.ph11.split.us_crit_edge ]
  br label %.lr.ph5.us.us

._crit_edge9.us:                                  ; preds = %._crit_edge6.us.us
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %5 = icmp slt i64 %indvars.iv.next58, 150
  br i1 %5, label %._crit_edge9.us..lr.ph11.split.us_crit_edge, label %._crit_edge9.us..lr.ph2.split.us_crit_edge

._crit_edge9.us..lr.ph2.split.us_crit_edge:       ; preds = %._crit_edge9.us
  br label %.lr.ph2.split.us

._crit_edge9.us..lr.ph11.split.us_crit_edge:      ; preds = %._crit_edge9.us
  br label %.lr.ph11.split.us

.lr.ph5.us.us:                                    ; preds = %._crit_edge6.us.us..lr.ph5.us.us_crit_edge, %.lr.ph11.split.us
  %indvars.iv53 = phi i64 [ %indvars.iv.next54, %._crit_edge6.us.us..lr.ph5.us.us_crit_edge ], [ 0, %.lr.ph11.split.us ]
  %6 = mul nsw i64 %indvars.iv53, %indvars.iv57
  br label %.lr.ph5.us.us.new

._crit_edge6.us.us:                               ; preds = %.lr.ph5.us.us.new
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %exitcond56 = icmp eq i64 %indvars.iv.next54, 140
  br i1 %exitcond56, label %._crit_edge9.us, label %._crit_edge6.us.us..lr.ph5.us.us_crit_edge

._crit_edge6.us.us..lr.ph5.us.us_crit_edge:       ; preds = %._crit_edge6.us.us
  br label %.lr.ph5.us.us

.lr.ph5.us.us.new:                                ; preds = %.lr.ph5.us.us.new..lr.ph5.us.us.new_crit_edge, %.lr.ph5.us.us
  %indvars.iv49 = phi i64 [ %indvars.iv.next50.1, %.lr.ph5.us.us.new..lr.ph5.us.us.new_crit_edge ], [ 0, %.lr.ph5.us.us ]
  %7 = add nsw i64 %6, %indvars.iv49
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 160
  %10 = sitofp i32 %9 to double
  %11 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv57, i64 %indvars.iv53, i64 %indvars.iv49
  %indvars.iv.next50 = or i64 %indvars.iv49, 1
  %12 = add nsw i64 %6, %indvars.iv.next50
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 160
  %15 = sitofp i32 %14 to double
  %16 = insertelement <2 x double> undef, double %10, i32 0
  %17 = insertelement <2 x double> %16, double %15, i32 1
  %18 = fdiv <2 x double> %17, <double 1.600000e+02, double 1.600000e+02>
  %19 = bitcast double* %11 to <2 x double>*
  store <2 x double> %18, <2 x double>* %19, align 8
  %indvars.iv.next50.1 = add nuw nsw i64 %indvars.iv49, 2
  %exitcond52.1 = icmp eq i64 %indvars.iv.next50.1, 160
  br i1 %exitcond52.1, label %._crit_edge6.us.us, label %.lr.ph5.us.us.new..lr.ph5.us.us.new_crit_edge

.lr.ph5.us.us.new..lr.ph5.us.us.new_crit_edge:    ; preds = %.lr.ph5.us.us.new
  br label %.lr.ph5.us.us.new

.lr.ph2.split.us:                                 ; preds = %._crit_edge.us..lr.ph2.split.us_crit_edge, %._crit_edge9.us..lr.ph2.split.us_crit_edge
  %indvars.iv46 = phi i64 [ %indvars.iv.next47, %._crit_edge.us..lr.ph2.split.us_crit_edge ], [ 0, %._crit_edge9.us..lr.ph2.split.us_crit_edge ]
  br label %.lr.ph2.split.us.new

.lr.ph2.split.us.new:                             ; preds = %.lr.ph2.split.us.new..lr.ph2.split.us.new_crit_edge, %.lr.ph2.split.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph2.split.us.new..lr.ph2.split.us.new_crit_edge ], [ 0, %.lr.ph2.split.us ]
  %20 = mul nsw i64 %indvars.iv, %indvars.iv46
  %21 = trunc i64 %20 to i32
  %22 = srem i32 %21, 160
  %23 = sitofp i32 %22 to double
  %24 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv46, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %25 = mul nsw i64 %indvars.iv.next, %indvars.iv46
  %26 = trunc i64 %25 to i32
  %27 = srem i32 %26, 160
  %28 = sitofp i32 %27 to double
  %29 = insertelement <2 x double> undef, double %23, i32 0
  %30 = insertelement <2 x double> %29, double %28, i32 1
  %31 = fdiv <2 x double> %30, <double 1.600000e+02, double 1.600000e+02>
  %32 = bitcast double* %24 to <2 x double>*
  store <2 x double> %31, <2 x double>* %32, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 160
  br i1 %exitcond.1, label %._crit_edge.us, label %.lr.ph2.split.us.new..lr.ph2.split.us.new_crit_edge

.lr.ph2.split.us.new..lr.ph2.split.us.new_crit_edge: ; preds = %.lr.ph2.split.us.new
  br label %.lr.ph2.split.us.new

._crit_edge.us:                                   ; preds = %.lr.ph2.split.us.new
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %33 = icmp slt i64 %indvars.iv.next47, 160
  br i1 %33, label %._crit_edge.us..lr.ph2.split.us_crit_edge, label %._crit_edge3

._crit_edge.us..lr.ph2.split.us_crit_edge:        ; preds = %._crit_edge.us
  br label %.lr.ph2.split.us

._crit_edge3:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #2

declare void @polybench_timer_stop(...) local_unnamed_addr #2

declare void @polybench_timer_print(...) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, i32, [140 x [160 x double]]*) unnamed_addr #1 {
.lr.ph5:
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph5.split.us

.lr.ph5.split.us:                                 ; preds = %._crit_edge3.us..lr.ph5.split.us_crit_edge, %.lr.ph5
  %indvars.iv35 = phi i64 [ 0, %.lr.ph5 ], [ %indvars.iv.next36, %._crit_edge3.us..lr.ph5.split.us_crit_edge ]
  %8 = mul nsw i64 %indvars.iv35, 140
  br label %.lr.ph.us.us

._crit_edge3.us:                                  ; preds = %._crit_edge.us.us
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %9 = icmp slt i64 %indvars.iv.next36, 150
  br i1 %9, label %._crit_edge3.us..lr.ph5.split.us_crit_edge, label %._crit_edge6

._crit_edge3.us..lr.ph5.split.us_crit_edge:       ; preds = %._crit_edge3.us
  br label %.lr.ph5.split.us

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us..lr.ph.us.us_crit_edge, %.lr.ph5.split.us
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %._crit_edge.us.us..lr.ph.us.us_crit_edge ], [ 0, %.lr.ph5.split.us ]
  %10 = add i64 %indvars.iv31, %8
  %11 = mul i64 %10, 160
  br label %12

._crit_edge.us.us:                                ; preds = %19
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next32, 140
  br i1 %exitcond34, label %._crit_edge3.us, label %._crit_edge.us.us..lr.ph.us.us_crit_edge

._crit_edge.us.us..lr.ph.us.us_crit_edge:         ; preds = %._crit_edge.us.us
  br label %.lr.ph.us.us

; <label>:12:                                     ; preds = %._crit_edge38, %.lr.ph.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge38 ], [ 0, %.lr.ph.us.us ]
  %13 = add i64 %11, %indvars.iv
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 20
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %._crit_edge

._crit_edge:                                      ; preds = %12
  br label %19

; <label>:17:                                     ; preds = %12
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = call i32 @fputc(i32 10, %struct._IO_FILE* %18) #5
  br label %19

; <label>:19:                                     ; preds = %._crit_edge, %17
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv35, i64 %indvars.iv31, i64 %indvars.iv
  %22 = load double, double* %21, align 8
  %23 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %22) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next, 160
  br i1 %exitcond30, label %._crit_edge.us.us, label %._crit_edge38

._crit_edge38:                                    ; preds = %19
  br label %12

._crit_edge6:                                     ; preds = %._crit_edge3.us
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %26) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #2

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

attributes #0 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
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
