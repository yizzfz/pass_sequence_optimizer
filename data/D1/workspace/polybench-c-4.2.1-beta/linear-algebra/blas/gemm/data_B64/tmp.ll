; ModuleID = 'A.ll'
source_filename = "gemm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 1100000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1320000, i32 8) #4
  %8 = bitcast i8* %5 to [1100 x double]*
  %9 = bitcast i8* %6 to [1200 x double]*
  %10 = bitcast i8* %7 to [1100 x double]*
  call fastcc void @init_array(i32 1000, i32 1100, i32 1200, double* nonnull %3, double* nonnull %4, [1100 x double]* %8, [1200 x double]* %9, [1100 x double]* %10)
  call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  %13 = bitcast i8* %7 to [1100 x double]*
  call fastcc void @kernel_gemm(i32 1000, i32 1100, i32 1200, double %11, double %12, [1100 x double]* %8, [1200 x double]* %9, [1100 x double]* %13)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %14 = icmp sgt i32 %0, 42
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %2
  %16 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %16, align 1
  %17 = icmp eq i8 %strcmpload, 0
  br i1 %17, label %18, label %._crit_edge

; <label>:18:                                     ; preds = %15
  call fastcc void @print_array(i32 1000, i32 1100, [1100 x double]* %8)
  br label %._crit_edge

._crit_edge:                                      ; preds = %15, %2, %18
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, i32, double*, double*, [1100 x double]*, [1200 x double]*, [1100 x double]*) unnamed_addr #2 {
  store double 1.500000e+00, double* %3, align 8
  store double 1.200000e+00, double* %4, align 8
  %9 = icmp sgt i32 %0, 0
  br i1 %9, label %.preheader9.lr.ph, label %.preheader8.thread

.preheader8.thread:                               ; preds = %8
  br label %.preheader6

.preheader9.lr.ph:                                ; preds = %8
  %10 = icmp sgt i32 %1, 0
  %11 = sitofp i32 %0 to double
  br i1 %10, label %.preheader9.us.preheader, label %.preheader8

.preheader9.us.preheader:                         ; preds = %.preheader9.lr.ph
  %12 = sext i32 %0 to i64
  %wide.trip.count68 = zext i32 %1 to i64
  br label %.preheader9.us

.preheader9.us:                                   ; preds = %.preheader9.us.preheader, %._crit_edge30.us
  %indvars.iv60 = phi i64 [ 0, %.preheader9.us.preheader ], [ %indvars.iv.next61, %._crit_edge30.us ]
  br label %13

; <label>:13:                                     ; preds = %13, %.preheader9.us
  %indvars.iv56 = phi i64 [ 0, %.preheader9.us ], [ %indvars.iv.next57, %13 ]
  %14 = mul nsw i64 %indvars.iv60, %indvars.iv56
  %15 = add nsw i64 %14, 1
  %16 = trunc i64 %15 to i32
  %17 = srem i32 %16, %0
  %18 = sitofp i32 %17 to double
  %19 = fdiv double %18, %11
  %20 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv60, i64 %indvars.iv56
  store double %19, double* %20, align 8
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %exitcond69 = icmp eq i64 %indvars.iv.next57, %wide.trip.count68
  br i1 %exitcond69, label %._crit_edge30.us, label %13

._crit_edge30.us:                                 ; preds = %13
  %indvars.iv.next61 = add nsw i64 %indvars.iv60, 1
  %21 = icmp slt i64 %indvars.iv.next61, %12
  br i1 %21, label %.preheader9.us, label %.preheader8.loopexit

.preheader8.loopexit:                             ; preds = %._crit_edge30.us
  br label %.preheader8

.preheader8:                                      ; preds = %.preheader8.loopexit, %.preheader9.lr.ph
  br i1 true, label %.preheader7.lr.ph, label %.preheader8..preheader6_crit_edge

.preheader8..preheader6_crit_edge:                ; preds = %.preheader8
  br label %.preheader6

.preheader7.lr.ph:                                ; preds = %.preheader8
  %22 = icmp sgt i32 %2, 0
  br i1 %22, label %.preheader7.us.preheader, label %..preheader6_crit_edge.loopexit39

.preheader7.us.preheader:                         ; preds = %.preheader7.lr.ph
  %23 = sext i32 %0 to i64
  %24 = sitofp i32 %2 to double
  %wide.trip.count = zext i32 %2 to i64
  %xtraiter = and i64 %wide.trip.count, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %25 = icmp eq i32 %2, 1
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %.preheader7.us.preheader, %._crit_edge20.us
  %indvars.iv52 = phi i64 [ 0, %.preheader7.us.preheader ], [ %indvars.iv.next53, %._crit_edge20.us ]
  br i1 %lcmp.mod, label %.prol.loopexit.unr-lcssa, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader7.us
  br label %26

; <label>:26:                                     ; preds = %.prol.preheader
  %27 = trunc i64 %indvars.iv52 to i32
  %28 = srem i32 %27, %2
  %29 = sitofp i32 %28 to double
  %30 = fdiv double %29, %24
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv52, i64 0
  store double %30, double* %31, align 8
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.preheader7.us, %26
  %indvars.iv48.unr.ph = phi i64 [ 1, %26 ], [ 0, %.preheader7.us ]
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.unr-lcssa
  br i1 %25, label %._crit_edge20.us, label %.preheader7.us.new

.preheader7.us.new:                               ; preds = %.prol.loopexit
  br label %32

; <label>:32:                                     ; preds = %32, %.preheader7.us.new
  %indvars.iv48 = phi i64 [ %indvars.iv48.unr.ph, %.preheader7.us.new ], [ %indvars.iv.next49.1, %32 ]
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %33 = mul nsw i64 %indvars.iv52, %indvars.iv.next49
  %34 = trunc i64 %33 to i32
  %35 = srem i32 %34, %2
  %36 = sitofp i32 %35 to double
  %37 = fdiv double %36, %24
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv52, i64 %indvars.iv48
  store double %37, double* %38, align 8
  %indvars.iv.next49.1 = add nsw i64 %indvars.iv48, 2
  %39 = mul nsw i64 %indvars.iv52, %indvars.iv.next49.1
  %40 = trunc i64 %39 to i32
  %41 = srem i32 %40, %2
  %42 = sitofp i32 %41 to double
  %43 = fdiv double %42, %24
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv52, i64 %indvars.iv.next49
  store double %43, double* %44, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next49.1, %wide.trip.count
  br i1 %exitcond.1, label %._crit_edge20.us.unr-lcssa, label %32

._crit_edge20.us.unr-lcssa:                       ; preds = %32
  br label %._crit_edge20.us

._crit_edge20.us:                                 ; preds = %.prol.loopexit, %._crit_edge20.us.unr-lcssa
  %indvars.iv.next53 = add nsw i64 %indvars.iv52, 1
  %45 = icmp slt i64 %indvars.iv.next53, %23
  br i1 %45, label %.preheader7.us, label %..preheader6_crit_edge.loopexit

..preheader6_crit_edge.loopexit:                  ; preds = %._crit_edge20.us
  br label %..preheader6_crit_edge

..preheader6_crit_edge.loopexit39:                ; preds = %.preheader7.lr.ph
  br label %..preheader6_crit_edge

..preheader6_crit_edge:                           ; preds = %..preheader6_crit_edge.loopexit39, %..preheader6_crit_edge.loopexit
  br label %.preheader6

.preheader6:                                      ; preds = %.preheader8..preheader6_crit_edge, %.preheader8.thread, %..preheader6_crit_edge
  %46 = icmp sgt i32 %2, 0
  br i1 %46, label %.preheader.lr.ph, label %59

.preheader.lr.ph:                                 ; preds = %.preheader6
  %47 = icmp sgt i32 %1, 0
  br i1 %47, label %.preheader.us.preheader, label %._crit_edge14.loopexit38

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %48 = sext i32 %2 to i64
  %49 = sitofp i32 %1 to double
  %wide.trip.count64 = zext i32 %1 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv46 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next47, %._crit_edge.us ]
  br label %50

; <label>:50:                                     ; preds = %50, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %50 ]
  %51 = add nuw nsw i64 %indvars.iv, 2
  %52 = mul nsw i64 %indvars.iv46, %51
  %53 = trunc i64 %52 to i32
  %54 = srem i32 %53, %1
  %55 = sitofp i32 %54 to double
  %56 = fdiv double %55, %49
  %57 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv46, i64 %indvars.iv
  store double %56, double* %57, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond65 = icmp eq i64 %indvars.iv.next, %wide.trip.count64
  br i1 %exitcond65, label %._crit_edge.us, label %50

._crit_edge.us:                                   ; preds = %50
  %indvars.iv.next47 = add nsw i64 %indvars.iv46, 1
  %58 = icmp slt i64 %indvars.iv.next47, %48
  br i1 %58, label %.preheader.us, label %._crit_edge14.loopexit

._crit_edge14.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge14

._crit_edge14.loopexit38:                         ; preds = %.preheader.lr.ph
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit38, %._crit_edge14.loopexit
  br label %59

; <label>:59:                                     ; preds = %._crit_edge14, %.preheader6
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_gemm(i32, i32, i32, double, double, [1100 x double]*, [1200 x double]*, [1100 x double]*) unnamed_addr #2 {
  %9 = icmp sgt i32 %0, 0
  br i1 %9, label %.preheader5.lr.ph, label %85

.preheader5.lr.ph:                                ; preds = %8
  %10 = icmp sgt i32 %1, 0
  %11 = icmp sgt i32 %2, 0
  %12 = sext i32 %1 to i64
  %13 = sext i32 %0 to i64
  br i1 %10, label %.preheader5.us.preheader, label %.preheader5.preheader

.preheader5.preheader:                            ; preds = %.preheader5.lr.ph
  %xtraiter152 = and i64 %13, 1
  %lcmp.mod153 = icmp eq i64 %xtraiter152, 0
  br i1 %lcmp.mod153, label %.preheader5.prol.loopexit, label %.preheader5.prol.preheader

.preheader5.prol.preheader:                       ; preds = %.preheader5.preheader
  br label %.preheader5.prol

.preheader5.prol:                                 ; preds = %.preheader5.prol.preheader
  br label %._crit_edge11.prol

.preheader5..preheader.us_crit_edge.prol:         ; No predecessors!
  br label %.preheader.us.prol

.preheader.us.prol:                               ; preds = %.preheader5..preheader.us_crit_edge.prol
  br label %scalar.ph.preheader.prol

min.iters.checked.prol:                           ; No predecessors!
  br label %scalar.ph.preheader.prol

vector.memcheck.prol:                             ; No predecessors!
  br label %scalar.ph.preheader.prol

vector.ph.prol:                                   ; No predecessors!
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.ph.prol
  br label %._crit_edge.us.prol

scalar.ph.preheader.prol:                         ; preds = %min.iters.checked.prol, %.preheader.us.prol, %vector.memcheck.prol
  br label %scalar.ph.prol

scalar.ph.prol:                                   ; preds = %scalar.ph.preheader.prol
  br label %._crit_edge.us.prol

._crit_edge.us.prol:                              ; preds = %vector.body.prol, %scalar.ph.prol
  br label %._crit_edge11.prol

._crit_edge11.prol:                               ; preds = %.preheader5.prol, %._crit_edge.us.prol
  br label %.preheader5.prol.loopexit

.preheader5.prol.loopexit:                        ; preds = %.preheader5.preheader, %._crit_edge11.prol
  %indvars.iv53.unr = phi i64 [ 0, %.preheader5.preheader ], [ 1, %._crit_edge11.prol ]
  %14 = icmp eq i32 %0, 1
  br i1 %14, label %._crit_edge16.loopexit151, label %.preheader5.preheader.new

.preheader5.preheader.new:                        ; preds = %.preheader5.prol.loopexit
  br label %.preheader5

.preheader5.us.preheader:                         ; preds = %.preheader5.lr.ph
  %15 = add i32 %1, -1
  %16 = zext i32 %2 to i64
  %xtraiter = and i32 %1, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %17 = icmp ult i32 %15, 3
  %wide.trip.count55.3 = zext i32 %1 to i64
  %18 = icmp sgt i64 %12, 1
  %smax85 = select i1 %18, i64 %12, i64 1
  %19 = add nsw i64 %wide.trip.count55.3, -4
  %min.iters.check86 = icmp ult i64 %smax85, 4
  %n.vec89 = and i64 %smax85, 9223372036854775804
  %cmp.zero90 = icmp eq i64 %n.vec89, 0
  %broadcast.splatinsert123 = insertelement <2 x double> undef, double %3, i32 0
  %cmp.n118 = icmp eq i64 %smax85, %n.vec89
  %broadcast.splatinsert148 = insertelement <2 x double> undef, double %4, i32 0
  %broadcast.splat149 = shufflevector <2 x double> %broadcast.splatinsert148, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader5.us

.preheader5.us:                                   ; preds = %.preheader5.us.preheader, %._crit_edge11.us
  %indvar92 = phi i64 [ 0, %.preheader5.us.preheader ], [ %indvar.next93, %._crit_edge11.us ]
  %indvars.iv44 = phi i64 [ 0, %.preheader5.us.preheader ], [ %indvars.iv.next45, %._crit_edge11.us ]
  %scevgep94 = getelementptr [1100 x double], [1100 x double]* %5, i64 %indvar92, i64 0
  %scevgep97 = getelementptr [1100 x double], [1100 x double]* %5, i64 %indvar92, i64 %smax85
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.preheader5.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %20 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv44, i64 %indvars.iv.prol
  %21 = load double, double* %20, align 8
  %22 = fmul double %21, %4
  store double %22, double* %20, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !1

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.preheader5.us
  %indvars.iv.unr = phi i64 [ 0, %.preheader5.us ], [ %indvars.iv.next.prol, %.prol.loopexit.loopexit ]
  br i1 %17, label %..preheader4_crit_edge.us, label %.preheader5.us.new.preheader

.preheader5.us.new.preheader:                     ; preds = %.prol.loopexit
  %23 = sub i64 %19, %indvars.iv.unr
  %24 = lshr i64 %23, 2
  %25 = add nuw nsw i64 %24, 1
  %min.iters.check132 = icmp ult i64 %25, 2
  br i1 %min.iters.check132, label %.preheader5.us.new.preheader150, label %min.iters.checked133

.preheader5.us.new.preheader150:                  ; preds = %middle.block130, %min.iters.checked133, %.preheader5.us.new.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked133 ], [ %indvars.iv.unr, %.preheader5.us.new.preheader ], [ %ind.end, %middle.block130 ]
  br label %.preheader5.us.new

min.iters.checked133:                             ; preds = %.preheader5.us.new.preheader
  %n.mod.vf134 = and i64 %25, 1
  %n.vec135 = sub nsw i64 %25, %n.mod.vf134
  %cmp.zero136 = icmp eq i64 %n.vec135, 0
  %26 = add i64 %indvars.iv.unr, 4
  %27 = shl nuw i64 %24, 2
  %28 = add i64 %26, %27
  %29 = shl nuw nsw i64 %n.mod.vf134, 2
  %ind.end = sub i64 %28, %29
  br i1 %cmp.zero136, label %.preheader5.us.new.preheader150, label %vector.ph137

vector.ph137:                                     ; preds = %min.iters.checked133
  br label %vector.body129

vector.body129:                                   ; preds = %vector.body129, %vector.ph137
  %index138 = phi i64 [ 0, %vector.ph137 ], [ %index.next139, %vector.body129 ]
  %30 = shl i64 %index138, 2
  %31 = add i64 %indvars.iv.unr, %30
  %32 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv44, i64 %31
  %33 = bitcast double* %32 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %33, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec145 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec146 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec147 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %34 = fmul <2 x double> %broadcast.splat149, %strided.vec
  %35 = fmul <2 x double> %broadcast.splat149, %strided.vec145
  %36 = fmul <2 x double> %broadcast.splat149, %strided.vec146
  %37 = add nsw i64 %31, 3
  %38 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv44, i64 %37
  %39 = fmul <2 x double> %broadcast.splat149, %strided.vec147
  %40 = getelementptr double, double* %38, i64 -3
  %41 = bitcast double* %40 to <8 x double>*
  %42 = shufflevector <2 x double> %34, <2 x double> %35, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %43 = shufflevector <2 x double> %36, <2 x double> %39, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %42, <4 x double> %43, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %41, align 8
  %index.next139 = add i64 %index138, 2
  %44 = icmp eq i64 %index.next139, %n.vec135
  br i1 %44, label %middle.block130, label %vector.body129, !llvm.loop !3

middle.block130:                                  ; preds = %vector.body129
  %cmp.n141 = icmp eq i64 %n.mod.vf134, 0
  br i1 %cmp.n141, label %..preheader4_crit_edge.us, label %.preheader5.us.new.preheader150

._crit_edge11.us.loopexit:                        ; preds = %._crit_edge.us.us
  br label %._crit_edge11.us

._crit_edge11.us:                                 ; preds = %._crit_edge11.us.loopexit, %..preheader4_crit_edge.us
  %indvars.iv.next45 = add nsw i64 %indvars.iv44, 1
  %45 = icmp slt i64 %indvars.iv.next45, %13
  %indvar.next93 = add i64 %indvar92, 1
  br i1 %45, label %.preheader5.us, label %._crit_edge16.loopexit

.preheader5.us.new:                               ; preds = %.preheader5.us.new.preheader150, %.preheader5.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.preheader5.us.new ], [ %indvars.iv.ph, %.preheader5.us.new.preheader150 ]
  %46 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv44, i64 %indvars.iv
  %47 = load double, double* %46, align 8
  %48 = fmul double %47, %4
  store double %48, double* %46, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %49 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv44, i64 %indvars.iv.next
  %50 = load double, double* %49, align 8
  %51 = fmul double %50, %4
  store double %51, double* %49, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %52 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv44, i64 %indvars.iv.next.1
  %53 = load double, double* %52, align 8
  %54 = fmul double %53, %4
  store double %54, double* %52, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %55 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv44, i64 %indvars.iv.next.2
  %56 = load double, double* %55, align 8
  %57 = fmul double %56, %4
  store double %57, double* %55, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond56.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count55.3
  br i1 %exitcond56.3, label %..preheader4_crit_edge.us.loopexit, label %.preheader5.us.new, !llvm.loop !6

..preheader4_crit_edge.us.loopexit:               ; preds = %.preheader5.us.new
  br label %..preheader4_crit_edge.us

..preheader4_crit_edge.us:                        ; preds = %..preheader4_crit_edge.us.loopexit, %middle.block130, %.prol.loopexit
  br i1 %11, label %.preheader.us.us.preheader, label %._crit_edge11.us

.preheader.us.us.preheader:                       ; preds = %..preheader4_crit_edge.us
  br label %.preheader.us.us

.preheader.us.us:                                 ; preds = %.preheader.us.us.preheader, %._crit_edge.us.us
  %indvars.iv40 = phi i64 [ %indvars.iv.next41, %._crit_edge.us.us ], [ 0, %.preheader.us.us.preheader ]
  %scevgep99 = getelementptr [1100 x double], [1100 x double]* %7, i64 %indvars.iv40, i64 0
  %scevgep101 = getelementptr [1100 x double], [1100 x double]* %7, i64 %indvars.iv40, i64 %smax85
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv44, i64 %indvars.iv40
  br i1 %min.iters.check86, label %scalar.ph84.preheader, label %min.iters.checked87

scalar.ph84.preheader:                            ; preds = %middle.block83, %vector.memcheck113, %min.iters.checked87, %.preheader.us.us
  %indvars.iv38.ph = phi i64 [ 0, %vector.memcheck113 ], [ 0, %min.iters.checked87 ], [ 0, %.preheader.us.us ], [ %n.vec89, %middle.block83 ]
  br label %scalar.ph84

min.iters.checked87:                              ; preds = %.preheader.us.us
  br i1 %cmp.zero90, label %scalar.ph84.preheader, label %vector.memcheck113

vector.memcheck113:                               ; preds = %min.iters.checked87
  %bound0105 = icmp ult double* %scevgep94, %58
  %bound1106 = icmp ult double* %58, %scevgep97
  %found.conflict107 = and i1 %bound0105, %bound1106
  %bound0108 = icmp ult double* %scevgep94, %scevgep101
  %bound1109 = icmp ult double* %scevgep99, %scevgep97
  %found.conflict110 = and i1 %bound0108, %bound1109
  %conflict.rdx111 = or i1 %found.conflict107, %found.conflict110
  br i1 %conflict.rdx111, label %scalar.ph84.preheader, label %vector.ph114

vector.ph114:                                     ; preds = %vector.memcheck113
  br label %vector.body82

vector.body82:                                    ; preds = %vector.body82, %vector.ph114
  %index115 = phi i64 [ 0, %vector.ph114 ], [ %index.next116, %vector.body82 ]
  %59 = load double, double* %58, align 8, !alias.scope !8
  %60 = insertelement <2 x double> undef, double %59, i32 0
  %61 = fmul <2 x double> %broadcast.splatinsert123, %60
  %62 = shufflevector <2 x double> %61, <2 x double> undef, <2 x i32> zeroinitializer
  %63 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv40, i64 %index115
  %64 = bitcast double* %63 to <2 x double>*
  %wide.load125 = load <2 x double>, <2 x double>* %64, align 8, !alias.scope !11
  %65 = getelementptr double, double* %63, i64 2
  %66 = bitcast double* %65 to <2 x double>*
  %wide.load126 = load <2 x double>, <2 x double>* %66, align 8, !alias.scope !11
  %67 = fmul <2 x double> %62, %wide.load125
  %68 = fmul <2 x double> %62, %wide.load126
  %69 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv44, i64 %index115
  %70 = bitcast double* %69 to <2 x double>*
  %wide.load127 = load <2 x double>, <2 x double>* %70, align 8, !alias.scope !13, !noalias !15
  %71 = getelementptr double, double* %69, i64 2
  %72 = bitcast double* %71 to <2 x double>*
  %wide.load128 = load <2 x double>, <2 x double>* %72, align 8, !alias.scope !13, !noalias !15
  %73 = fadd <2 x double> %67, %wide.load127
  %74 = fadd <2 x double> %68, %wide.load128
  store <2 x double> %73, <2 x double>* %70, align 8, !alias.scope !13, !noalias !15
  store <2 x double> %74, <2 x double>* %72, align 8, !alias.scope !13, !noalias !15
  %index.next116 = add i64 %index115, 4
  %75 = icmp eq i64 %index.next116, %n.vec89
  br i1 %75, label %middle.block83, label %vector.body82, !llvm.loop !16

middle.block83:                                   ; preds = %vector.body82
  br i1 %cmp.n118, label %._crit_edge.us.us, label %scalar.ph84.preheader

._crit_edge.us.us.loopexit:                       ; preds = %scalar.ph84
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %middle.block83
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %exitcond = icmp eq i64 %indvars.iv.next41, %16
  br i1 %exitcond, label %._crit_edge11.us.loopexit, label %.preheader.us.us

scalar.ph84:                                      ; preds = %scalar.ph84.preheader, %scalar.ph84
  %indvars.iv38 = phi i64 [ %indvars.iv.next39, %scalar.ph84 ], [ %indvars.iv38.ph, %scalar.ph84.preheader ]
  %76 = load double, double* %58, align 8
  %77 = fmul double %76, %3
  %78 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv40, i64 %indvars.iv38
  %79 = load double, double* %78, align 8
  %80 = fmul double %77, %79
  %81 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv44, i64 %indvars.iv38
  %82 = load double, double* %81, align 8
  %83 = fadd double %80, %82
  store double %83, double* %81, align 8
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %84 = icmp slt i64 %indvars.iv.next39, %12
  br i1 %84, label %scalar.ph84, label %._crit_edge.us.us.loopexit, !llvm.loop !17

.preheader5:                                      ; preds = %._crit_edge11.1, %.preheader5.preheader.new
  %indvars.iv53 = phi i64 [ %indvars.iv53.unr, %.preheader5.preheader.new ], [ %indvars.iv.next54.1, %._crit_edge11.1 ]
  br label %._crit_edge11

.preheader5..preheader.us_crit_edge:              ; No predecessors!
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader5..preheader.us_crit_edge
  br label %scalar.ph.preheader

min.iters.checked:                                ; No predecessors!
  br label %scalar.ph.preheader

vector.memcheck:                                  ; No predecessors!
  br label %scalar.ph.preheader

vector.ph:                                        ; No predecessors!
  br label %vector.body

vector.body:                                      ; preds = %vector.ph
  br label %._crit_edge.us

scalar.ph.preheader:                              ; preds = %vector.memcheck, %.preheader.us, %min.iters.checked
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %vector.body, %scalar.ph
  unreachable

._crit_edge11:                                    ; preds = %.preheader5
  br label %._crit_edge11.1

._crit_edge16.loopexit:                           ; preds = %._crit_edge11.us
  br label %._crit_edge16

._crit_edge16.loopexit151.unr-lcssa:              ; preds = %._crit_edge11.1
  br label %._crit_edge16.loopexit151

._crit_edge16.loopexit151:                        ; preds = %.preheader5.prol.loopexit, %._crit_edge16.loopexit151.unr-lcssa
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge16.loopexit151, %._crit_edge16.loopexit
  br label %85

; <label>:85:                                     ; preds = %._crit_edge16, %8
  ret void

.preheader5..preheader.us_crit_edge.1:            ; No predecessors!
  br label %.preheader.us.1

.preheader.us.1:                                  ; preds = %.preheader5..preheader.us_crit_edge.1
  br label %scalar.ph.preheader.1

min.iters.checked.1:                              ; No predecessors!
  br label %scalar.ph.preheader.1

vector.memcheck.1:                                ; No predecessors!
  br label %scalar.ph.preheader.1

vector.ph.1:                                      ; No predecessors!
  br label %vector.body.1

vector.body.1:                                    ; preds = %vector.ph.1
  br label %._crit_edge.us.1

scalar.ph.preheader.1:                            ; preds = %.preheader.us.1, %min.iters.checked.1, %vector.memcheck.1
  br label %scalar.ph.1

scalar.ph.1:                                      ; preds = %scalar.ph.preheader.1
  br label %._crit_edge.us.1

._crit_edge.us.1:                                 ; preds = %vector.body.1, %scalar.ph.1
  unreachable

._crit_edge11.1:                                  ; preds = %._crit_edge11
  %indvars.iv.next54.1 = add nsw i64 %indvars.iv53, 2
  %86 = icmp slt i64 %indvars.iv.next54.1, %13
  br i1 %86, label %.preheader5, label %._crit_edge16.loopexit151.unr-lcssa
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1100 x double]*) unnamed_addr #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.preheader.lr.ph, label %24

.preheader.lr.ph:                                 ; preds = %3
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %.preheader.us.preheader, label %._crit_edge5.loopexit10

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %10 = sext i32 %0 to i64
  %wide.trip.count14 = zext i32 %1 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge3.us
  %indvars.iv12 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next13, %._crit_edge3.us ]
  %11 = mul nsw i64 %10, %indvars.iv12
  br label %12

; <label>:12:                                     ; preds = %._crit_edge.us, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge.us ]
  %13 = add nsw i64 %11, %indvars.iv
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 20
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %._crit_edge.us

; <label>:17:                                     ; preds = %12
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %18) #5
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %17, %12
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv12, i64 %indvars.iv
  %21 = load double, double* %20, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %21) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next, %wide.trip.count14
  br i1 %exitcond15, label %._crit_edge3.us, label %12

._crit_edge3.us:                                  ; preds = %._crit_edge.us
  %indvars.iv.next13 = add nsw i64 %indvars.iv12, 1
  %23 = icmp slt i64 %indvars.iv.next13, %10
  br i1 %23, label %.preheader.us, label %._crit_edge5.loopexit

._crit_edge5.loopexit:                            ; preds = %._crit_edge3.us
  br label %._crit_edge5

._crit_edge5.loopexit10:                          ; preds = %.preheader.lr.ph
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge5.loopexit10, %._crit_edge5.loopexit
  br label %24

; <label>:24:                                     ; preds = %._crit_edge5, %3
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %28 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %27) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}
!8 = !{!9}
!9 = distinct !{!9, !10}
!10 = distinct !{!10, !"LVerDomain"}
!11 = !{!12}
!12 = distinct !{!12, !10}
!13 = !{!14}
!14 = distinct !{!14, !10}
!15 = !{!9, !12}
!16 = distinct !{!16, !4, !5}
!17 = distinct !{!17, !4, !5}
