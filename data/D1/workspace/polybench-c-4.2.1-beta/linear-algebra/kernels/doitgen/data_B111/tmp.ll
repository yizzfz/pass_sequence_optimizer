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
  br i1 %7, label %.preheader6.lr.ph, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %6
  br label %._crit_edge

.preheader6.lr.ph:                                ; preds = %6
  %8 = sext i32 %2 to i64
  %9 = sext i32 %1 to i64
  %10 = sext i32 %0 to i64
  %xtraiter = and i32 %2, 1
  %wide.trip.count61 = zext i32 %2 to i64
  %scevgep87 = getelementptr double, double* %5, i64 %8
  %11 = add nsw i64 %9, -1
  %12 = icmp sgt i32 %1, 0
  %13 = icmp sgt i32 %2, 0
  %14 = icmp eq i32 %xtraiter, 0
  %15 = icmp eq i32 %2, 1
  %sunkaddr79 = ptrtoint double* %5 to i64
  %sunkaddr = ptrtoint double* %5 to i64
  %min.iters.check = icmp ult i32 %2, 4
  %n.vec = and i64 %8, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i64 %8, %n.vec
  br label %.preheader6

.preheader6:                                      ; preds = %._crit_edge18..preheader6_crit_edge, %.preheader6.lr.ph
  %indvars.iv67 = phi i64 [ 0, %.preheader6.lr.ph ], [ %indvars.iv.next68, %._crit_edge18..preheader6_crit_edge ]
  br i1 %12, label %.preheader5.lr.ph, label %.preheader6.._crit_edge18_crit_edge

.preheader6.._crit_edge18_crit_edge:              ; preds = %.preheader6
  br label %._crit_edge18

.preheader5.lr.ph:                                ; preds = %.preheader6
  br i1 %13, label %.preheader5.us.preheader, label %.preheader5.preheader

.preheader5.preheader:                            ; preds = %.preheader5.lr.ph
  br label %.preheader5

.preheader5.us.preheader:                         ; preds = %.preheader5.lr.ph
  br label %.preheader5.us

.preheader5.us:                                   ; preds = %._crit_edge16.us..preheader5.us_crit_edge, %.preheader5.us.preheader
  %indvars.iv65 = phi i64 [ %indvars.iv.next66, %._crit_edge16.us..preheader5.us_crit_edge ], [ 0, %.preheader5.us.preheader ]
  %16 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv67, i64 %indvars.iv65, i64 0
  br label %.lr.ph.us.us

._crit_edge16.us.loopexit:                        ; preds = %._crit_edge71
  br label %._crit_edge16.us

._crit_edge16.us:                                 ; preds = %middle.block.._crit_edge16.us_crit_edge, %._crit_edge16.us.loopexit
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %17 = icmp slt i64 %indvars.iv.next66, %9
  br i1 %17, label %._crit_edge16.us..preheader5.us_crit_edge, label %._crit_edge18.loopexit

._crit_edge16.us..preheader5.us_crit_edge:        ; preds = %._crit_edge16.us
  br label %.preheader5.us

._crit_edge71:                                    ; preds = %._crit_edge71.._crit_edge71_crit_edge, %._crit_edge71.preheader123
  %indvars.iv63 = phi i64 [ %indvars.iv.next64, %._crit_edge71.._crit_edge71_crit_edge ], [ %indvars.iv63.ph, %._crit_edge71.preheader123 ]
  %18 = getelementptr inbounds double, double* %5, i64 %indvars.iv63
  %19 = bitcast double* %18 to i64*
  %20 = load i64, i64* %19, align 8
  %21 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv67, i64 %indvars.iv65, i64 %indvars.iv63
  %22 = bitcast double* %21 to i64*
  store i64 %20, i64* %22, align 8
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %23 = icmp slt i64 %indvars.iv.next64, %8
  br i1 %23, label %._crit_edge71.._crit_edge71_crit_edge, label %._crit_edge16.us.loopexit, !llvm.loop !1

._crit_edge71.._crit_edge71_crit_edge:            ; preds = %._crit_edge71
  br label %._crit_edge71

._crit_edge71.preheader:                          ; preds = %._crit_edge.us.us
  %scevgep = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv67, i64 %indvars.iv65, i64 0
  %scevgep85 = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv67, i64 %indvars.iv65, i64 %8
  br i1 %min.iters.check, label %._crit_edge71.preheader.._crit_edge71.preheader123_crit_edge, label %min.iters.checked

._crit_edge71.preheader.._crit_edge71.preheader123_crit_edge: ; preds = %._crit_edge71.preheader
  br label %._crit_edge71.preheader123

._crit_edge71.preheader123:                       ; preds = %middle.block.._crit_edge71.preheader123_crit_edge, %vector.memcheck.._crit_edge71.preheader123_crit_edge, %min.iters.checked.._crit_edge71.preheader123_crit_edge, %._crit_edge71.preheader.._crit_edge71.preheader123_crit_edge
  %indvars.iv63.ph = phi i64 [ 0, %vector.memcheck.._crit_edge71.preheader123_crit_edge ], [ 0, %min.iters.checked.._crit_edge71.preheader123_crit_edge ], [ 0, %._crit_edge71.preheader.._crit_edge71.preheader123_crit_edge ], [ %n.vec, %middle.block.._crit_edge71.preheader123_crit_edge ]
  br label %._crit_edge71

min.iters.checked:                                ; preds = %._crit_edge71.preheader
  br i1 %cmp.zero, label %min.iters.checked.._crit_edge71.preheader123_crit_edge, label %vector.memcheck

min.iters.checked.._crit_edge71.preheader123_crit_edge: ; preds = %min.iters.checked
  br label %._crit_edge71.preheader123

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep87
  %bound1 = icmp ugt double* %scevgep85, %5
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %vector.memcheck.._crit_edge71.preheader123_crit_edge, label %vector.body.preheader

vector.memcheck.._crit_edge71.preheader123_crit_edge: ; preds = %vector.memcheck
  br label %._crit_edge71.preheader123

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.body.preheader
  %index = phi i64 [ %index.next, %vector.body.vector.body_crit_edge ], [ 0, %vector.body.preheader ]
  %24 = getelementptr inbounds double, double* %5, i64 %index
  %25 = bitcast double* %24 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %25, align 8, !alias.scope !4
  %26 = getelementptr double, double* %24, i64 2
  %27 = bitcast double* %26 to <2 x i64>*
  %wide.load90 = load <2 x i64>, <2 x i64>* %27, align 8, !alias.scope !4
  %28 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv67, i64 %indvars.iv65, i64 %index
  %29 = bitcast double* %28 to <2 x i64>*
  store <2 x i64> %wide.load, <2 x i64>* %29, align 8, !alias.scope !7, !noalias !4
  %30 = getelementptr double, double* %28, i64 2
  %31 = bitcast double* %30 to <2 x i64>*
  store <2 x i64> %wide.load90, <2 x i64>* %31, align 8, !alias.scope !7, !noalias !4
  %index.next = add i64 %index, 4
  %32 = icmp eq i64 %index.next, %n.vec
  br i1 %32, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !9

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %middle.block.._crit_edge16.us_crit_edge, label %middle.block.._crit_edge71.preheader123_crit_edge

middle.block.._crit_edge71.preheader123_crit_edge: ; preds = %middle.block
  br label %._crit_edge71.preheader123

middle.block.._crit_edge16.us_crit_edge:          ; preds = %middle.block
  br label %._crit_edge16.us

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us..lr.ph.us.us_crit_edge, %.preheader5.us
  %indvars.iv59 = phi i64 [ %indvars.iv.next60, %._crit_edge.us.us..lr.ph.us.us_crit_edge ], [ 0, %.preheader5.us ]
  %33 = getelementptr inbounds double, double* %5, i64 %indvars.iv59
  store double 0.000000e+00, double* %33, align 8
  br i1 %14, label %.lr.ph.us.us..prol.loopexit_crit_edge, label %.prol.preheader

.lr.ph.us.us..prol.loopexit_crit_edge:            ; preds = %.lr.ph.us.us
  br label %.prol.loopexit

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %34 = load double, double* %16, align 8
  %35 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 0, i64 %indvars.iv59
  %36 = load double, double* %35, align 8
  %37 = fmul double %34, %36
  %sunkaddr76 = shl i64 %indvars.iv59, 3
  %sunkaddr77 = add i64 %sunkaddr, %sunkaddr76
  %sunkaddr78 = inttoptr i64 %sunkaddr77 to double*
  %38 = load double, double* %sunkaddr78, align 8
  %39 = fadd double %37, %38
  store double %39, double* %sunkaddr78, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph.us.us..prol.loopexit_crit_edge, %.prol.preheader
  %indvars.iv55.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us..prol.loopexit_crit_edge ]
  br i1 %15, label %.prol.loopexit.._crit_edge.us.us_crit_edge, label %.lr.ph.us.us.new.preheader

.prol.loopexit.._crit_edge.us.us_crit_edge:       ; preds = %.prol.loopexit
  br label %._crit_edge.us.us

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  %sunkaddr80 = shl i64 %indvars.iv59, 3
  %sunkaddr81 = add i64 %sunkaddr79, %sunkaddr80
  %sunkaddr82 = inttoptr i64 %sunkaddr81 to double*
  br label %.lr.ph.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %.prol.loopexit.._crit_edge.us.us_crit_edge, %._crit_edge.us.us.loopexit
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %exitcond62 = icmp eq i64 %indvars.iv.next60, %wide.trip.count61
  br i1 %exitcond62, label %._crit_edge71.preheader, label %._crit_edge.us.us..lr.ph.us.us_crit_edge

._crit_edge.us.us..lr.ph.us.us_crit_edge:         ; preds = %._crit_edge.us.us
  br label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge, %.lr.ph.us.us.new.preheader
  %indvars.iv55 = phi i64 [ %indvars.iv.next56.1, %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge ], [ %indvars.iv55.unr.ph, %.lr.ph.us.us.new.preheader ]
  %40 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv67, i64 %indvars.iv65, i64 %indvars.iv55
  %41 = load double, double* %40, align 8
  %42 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv55, i64 %indvars.iv59
  %43 = load double, double* %42, align 8
  %44 = fmul double %41, %43
  %45 = load double, double* %sunkaddr82, align 8
  %46 = fadd double %44, %45
  store double %46, double* %sunkaddr82, align 8
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %47 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv67, i64 %indvars.iv65, i64 %indvars.iv.next56
  %48 = load double, double* %47, align 8
  %49 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv.next56, i64 %indvars.iv59
  %50 = load double, double* %49, align 8
  %51 = fmul double %48, %50
  %52 = fadd double %51, %46
  store double %52, double* %sunkaddr82, align 8
  %indvars.iv.next56.1 = add nsw i64 %indvars.iv55, 2
  %exitcond58.1 = icmp eq i64 %indvars.iv.next56.1, %wide.trip.count61
  br i1 %exitcond58.1, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge

.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge:      ; preds = %.lr.ph.us.us.new
  br label %.lr.ph.us.us.new

.preheader5:                                      ; preds = %.preheader5..preheader5_crit_edge, %.preheader5.preheader
  %indvars.iv51 = phi i64 [ %indvars.iv.next52, %.preheader5..preheader5_crit_edge ], [ 0, %.preheader5.preheader ]
  %exitcond = icmp eq i64 %indvars.iv51, %11
  br i1 %exitcond, label %._crit_edge18.loopexit124, label %.preheader5..preheader5_crit_edge

.preheader5..preheader5_crit_edge:                ; preds = %.preheader5
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  br label %.preheader5

._crit_edge18.loopexit:                           ; preds = %._crit_edge16.us
  br label %._crit_edge18

._crit_edge18.loopexit124:                        ; preds = %.preheader5
  br label %._crit_edge18

._crit_edge18:                                    ; preds = %.preheader6.._crit_edge18_crit_edge, %._crit_edge18.loopexit124, %._crit_edge18.loopexit
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %53 = icmp slt i64 %indvars.iv.next68, %10
  br i1 %53, label %._crit_edge18..preheader6_crit_edge, label %._crit_edge.loopexit

._crit_edge18..preheader6_crit_edge:              ; preds = %._crit_edge18
  br label %.preheader6

._crit_edge.loopexit:                             ; preds = %._crit_edge18
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge, %._crit_edge.loopexit
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
  %8 = bitcast i8* %5 to [160 x double]*
  %9 = bitcast i8* %4 to double*
  call void @kernel_doitgen(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6, [160 x double]* %8, double* %9)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %10 = icmp sgt i32 %0, 42
  br i1 %10, label %11, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:11:                                     ; preds = %2
  %12 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %12, align 1
  %13 = icmp eq i8 %strcmpload, 0
  br i1 %13, label %14, label %.._crit_edge_crit_edge3

.._crit_edge_crit_edge3:                          ; preds = %11
  br label %._crit_edge

; <label>:14:                                     ; preds = %11
  call fastcc void @print_array(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge3, %.._crit_edge_crit_edge, %14
  call void @free(i8* %3) #4
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #2

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, i32, [140 x [160 x double]]*, [160 x double]*) unnamed_addr #0 {
.preheader7.lr.ph:
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %._crit_edge19.us..preheader7.us_crit_edge, %.preheader7.lr.ph
  %indvars.iv59 = phi i64 [ 0, %.preheader7.lr.ph ], [ %indvars.iv.next60, %._crit_edge19.us..preheader7.us_crit_edge ]
  br label %.preheader6.us.us

._crit_edge19.us:                                 ; preds = %._crit_edge16.us.us
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %5 = icmp slt i64 %indvars.iv.next60, 150
  br i1 %5, label %._crit_edge19.us..preheader7.us_crit_edge, label %.preheader.us.preheader

._crit_edge19.us..preheader7.us_crit_edge:        ; preds = %._crit_edge19.us
  br label %.preheader7.us

.preheader.us.preheader:                          ; preds = %._crit_edge19.us
  br label %.preheader.us

.preheader6.us.us:                                ; preds = %._crit_edge16.us.us..preheader6.us.us_crit_edge, %.preheader7.us
  %indvars.iv55 = phi i64 [ %indvars.iv.next56, %._crit_edge16.us.us..preheader6.us.us_crit_edge ], [ 0, %.preheader7.us ]
  %6 = mul nsw i64 %indvars.iv55, %indvars.iv59
  br label %._crit_edge

._crit_edge16.us.us:                              ; preds = %._crit_edge
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %exitcond58 = icmp eq i64 %indvars.iv.next56, 140
  br i1 %exitcond58, label %._crit_edge19.us, label %._crit_edge16.us.us..preheader6.us.us_crit_edge

._crit_edge16.us.us..preheader6.us.us_crit_edge:  ; preds = %._crit_edge16.us.us
  br label %.preheader6.us.us

._crit_edge:                                      ; preds = %._crit_edge.._crit_edge_crit_edge, %.preheader6.us.us
  %indvars.iv51 = phi i64 [ 0, %.preheader6.us.us ], [ %indvars.iv.next52, %._crit_edge.._crit_edge_crit_edge ]
  %7 = add nsw i64 %6, %indvars.iv51
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 160
  %10 = sitofp i32 %9 to double
  %11 = fdiv double %10, 1.600000e+02
  %12 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv59, i64 %indvars.iv55, i64 %indvars.iv51
  store double %11, double* %12, align 8
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %exitcond54 = icmp eq i64 %indvars.iv.next52, 160
  br i1 %exitcond54, label %._crit_edge16.us.us, label %._crit_edge.._crit_edge_crit_edge

._crit_edge.._crit_edge_crit_edge:                ; preds = %._crit_edge
  br label %._crit_edge

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv48 = phi i64 [ %indvars.iv.next49, %._crit_edge.us..preheader.us_crit_edge ], [ 0, %.preheader.us.preheader ]
  br label %._crit_edge65

._crit_edge65:                                    ; preds = %._crit_edge65.._crit_edge65_crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge65.._crit_edge65_crit_edge ]
  %13 = mul nsw i64 %indvars.iv48, %indvars.iv
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 160
  %16 = sitofp i32 %15 to double
  %17 = fdiv double %16, 1.600000e+02
  %18 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv48, i64 %indvars.iv
  store double %17, double* %18, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 160
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge65.._crit_edge65_crit_edge

._crit_edge65.._crit_edge65_crit_edge:            ; preds = %._crit_edge65
  br label %._crit_edge65

._crit_edge.us:                                   ; preds = %._crit_edge65
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %19 = icmp slt i64 %indvars.iv.next49, 160
  br i1 %19, label %._crit_edge.us..preheader.us_crit_edge, label %.preheader5._crit_edge

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

.preheader5._crit_edge:                           ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #2

declare void @polybench_timer_stop(...) local_unnamed_addr #2

declare void @polybench_timer_print(...) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, i32, [140 x [160 x double]]*) unnamed_addr #1 {
.preheader3.lr.ph:
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %._crit_edge6.us..preheader3.us_crit_edge, %.preheader3.lr.ph
  %indvars.iv39 = phi i64 [ 0, %.preheader3.lr.ph ], [ %indvars.iv.next40, %._crit_edge6.us..preheader3.us_crit_edge ]
  %8 = mul nsw i64 %indvars.iv39, 140
  br label %.preheader.us.us

._crit_edge6.us:                                  ; preds = %._crit_edge5.us.us
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %9 = icmp slt i64 %indvars.iv.next40, 150
  br i1 %9, label %._crit_edge6.us..preheader3.us_crit_edge, label %._crit_edge

._crit_edge6.us..preheader3.us_crit_edge:         ; preds = %._crit_edge6.us
  br label %.preheader3.us

.preheader.us.us:                                 ; preds = %._crit_edge5.us.us..preheader.us.us_crit_edge, %.preheader3.us
  %indvars.iv35 = phi i64 [ %indvars.iv.next36, %._crit_edge5.us.us..preheader.us.us_crit_edge ], [ 0, %.preheader3.us ]
  %10 = add i64 %8, %indvars.iv35
  %11 = mul i64 %10, 160
  br label %._crit_edge.us.us._crit_edge

._crit_edge5.us.us:                               ; preds = %._crit_edge.us.us
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next36, 140
  br i1 %exitcond38, label %._crit_edge6.us, label %._crit_edge5.us.us..preheader.us.us_crit_edge

._crit_edge5.us.us..preheader.us.us_crit_edge:    ; preds = %._crit_edge5.us.us
  br label %.preheader.us.us

._crit_edge.us.us._crit_edge:                     ; preds = %._crit_edge.us.us.._crit_edge.us.us._crit_edge_crit_edge, %.preheader.us.us
  %indvars.iv = phi i64 [ 0, %.preheader.us.us ], [ %indvars.iv.next, %._crit_edge.us.us.._crit_edge.us.us._crit_edge_crit_edge ]
  %12 = add i64 %11, %indvars.iv
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 20
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %._crit_edge.us.us._crit_edge.._crit_edge.us.us_crit_edge

._crit_edge.us.us._crit_edge.._crit_edge.us.us_crit_edge: ; preds = %._crit_edge.us.us._crit_edge
  br label %._crit_edge.us.us

; <label>:16:                                     ; preds = %._crit_edge.us.us._crit_edge
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = call i32 @fputc(i32 10, %struct._IO_FILE* %17) #5
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us._crit_edge.._crit_edge.us.us_crit_edge, %16
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv39, i64 %indvars.iv35, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next, 160
  br i1 %exitcond34, label %._crit_edge5.us.us, label %._crit_edge.us.us.._crit_edge.us.us._crit_edge_crit_edge

._crit_edge.us.us.._crit_edge.us.us._crit_edge_crit_edge: ; preds = %._crit_edge.us.us
  br label %._crit_edge.us.us._crit_edge

._crit_edge:                                      ; preds = %._crit_edge6.us
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #5
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
!1 = distinct !{!1, !2, !3}
!2 = !{!"llvm.loop.vectorize.width", i32 1}
!3 = !{!"llvm.loop.interleave.count", i32 1}
!4 = !{!5}
!5 = distinct !{!5, !6}
!6 = distinct !{!6, !"LVerDomain"}
!7 = !{!8}
!8 = distinct !{!8, !6}
!9 = distinct !{!9, !2, !3}
