; ModuleID = 'A.ll'
source_filename = "syrk.c"
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
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %7 = bitcast i8* %5 to [1200 x double]*
  %8 = bitcast i8* %6 to [1000 x double]*
  call fastcc void @init_array(i32 1200, i32 1000, double* nonnull %3, double* nonnull %4, [1200 x double]* %7, [1000 x double]* %8)
  call void (...) @polybench_timer_start() #4
  %9 = load double, double* %3, align 8
  %10 = load double, double* %4, align 8
  %11 = bitcast i8* %5 to [1200 x double]*
  %12 = bitcast i8* %6 to [1000 x double]*
  call fastcc void @kernel_syrk(i32 1200, i32 1000, double %9, double %10, [1200 x double]* %11, [1000 x double]* %12)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %14
  call fastcc void @print_array(i32 1200, [1200 x double]* %11)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, double* nocapture, [1200 x double]* nocapture, [1000 x double]* nocapture) unnamed_addr #2 {
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader5.lr.ph, label %.preheader4.thread

.preheader4.thread:                               ; preds = %6
  br label %.preheader4._crit_edge

.preheader5.lr.ph:                                ; preds = %6
  %8 = icmp sgt i32 %1, 0
  %9 = sitofp i32 %0 to double
  br i1 %8, label %.preheader5.us.preheader, label %.preheader4

.preheader5.us.preheader:                         ; preds = %.preheader5.lr.ph
  %10 = sext i32 %0 to i64
  %11 = zext i32 %1 to i64
  br label %.preheader5.us

.preheader5.us:                                   ; preds = %._crit_edge14.us, %.preheader5.us.preheader
  %indvars.iv33 = phi i64 [ 0, %.preheader5.us.preheader ], [ %indvars.iv.next34, %._crit_edge14.us ]
  br label %12

; <label>:12:                                     ; preds = %12, %.preheader5.us
  %indvars.iv29 = phi i64 [ 0, %.preheader5.us ], [ %indvars.iv.next30, %12 ]
  %13 = mul nsw i64 %indvars.iv29, %indvars.iv33
  %14 = add nsw i64 %13, 1
  %15 = trunc i64 %14 to i32
  %16 = srem i32 %15, %0
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, %9
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv33, i64 %indvars.iv29
  store double %18, double* %19, align 8
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %exitcond = icmp eq i64 %indvars.iv.next30, %11
  br i1 %exitcond, label %._crit_edge14.us, label %12

._crit_edge14.us:                                 ; preds = %12
  %indvars.iv.next34 = add nsw i64 %indvars.iv33, 1
  %20 = icmp slt i64 %indvars.iv.next34, %10
  br i1 %20, label %.preheader5.us, label %.preheader4.loopexit

.preheader4.loopexit:                             ; preds = %._crit_edge14.us
  br label %.preheader4

.preheader4:                                      ; preds = %.preheader4.loopexit, %.preheader5.lr.ph
  br i1 true, label %.preheader.lr.ph, label %.preheader4..preheader4._crit_edge_crit_edge

.preheader4..preheader4._crit_edge_crit_edge:     ; preds = %.preheader4
  br label %.preheader4._crit_edge

.preheader.lr.ph:                                 ; preds = %.preheader4
  %21 = sitofp i32 %1 to double
  br i1 true, label %.preheader.us.preheader, label %._crit_edge9.loopexit22

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %22 = sext i32 %0 to i64
  %23 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv27 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next28, %._crit_edge.us ]
  br label %24

; <label>:24:                                     ; preds = %24, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %24 ]
  %25 = mul nsw i64 %indvars.iv, %indvars.iv27
  %26 = add nsw i64 %25, 2
  %27 = trunc i64 %26 to i32
  %28 = srem i32 %27, %1
  %29 = sitofp i32 %28 to double
  %30 = fdiv double %29, %21
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv27, i64 %indvars.iv
  store double %30, double* %31, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond37 = icmp eq i64 %indvars.iv.next, %23
  br i1 %exitcond37, label %._crit_edge.us, label %24

._crit_edge.us:                                   ; preds = %24
  %indvars.iv.next28 = add nsw i64 %indvars.iv27, 1
  %32 = icmp slt i64 %indvars.iv.next28, %22
  br i1 %32, label %.preheader.us, label %._crit_edge9.loopexit

._crit_edge9.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge9

._crit_edge9.loopexit22:                          ; preds = %.preheader.lr.ph
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9.loopexit22, %._crit_edge9.loopexit
  br label %.preheader4._crit_edge

.preheader4._crit_edge:                           ; preds = %.preheader4..preheader4._crit_edge_crit_edge, %.preheader4.thread, %._crit_edge9
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syrk(i32, i32, double, double, [1200 x double]* nocapture, [1000 x double]* nocapture readonly) unnamed_addr #2 {
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader5.lr.ph, label %._crit_edge

.preheader5.lr.ph:                                ; preds = %6
  %8 = icmp sgt i32 %1, 0
  %9 = sext i32 %0 to i64
  br i1 %8, label %.preheader5.us.preheader, label %.preheader5.preheader

.preheader5.preheader:                            ; preds = %.preheader5.lr.ph
  %broadcast.splatinsert75 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat76 = shufflevector <2 x double> %broadcast.splatinsert75, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader5

.preheader5.us.preheader:                         ; preds = %.preheader5.lr.ph
  %10 = zext i32 %1 to i64
  %broadcast.splatinsert100 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat101 = shufflevector <2 x double> %broadcast.splatinsert100, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader5.us

.preheader5.us:                                   ; preds = %._crit_edge9.us..preheader5.us_crit_edge, %.preheader5.us.preheader
  %indvars.iv67 = phi i2 [ 1, %.preheader5.us.preheader ], [ %indvars.iv.next68, %._crit_edge9.us..preheader5.us_crit_edge ]
  %indvars.iv49 = phi i64 [ 0, %.preheader5.us.preheader ], [ %indvars.iv.next50, %._crit_edge9.us..preheader5.us_crit_edge ]
  %indvars.iv37 = phi i32 [ 1, %.preheader5.us.preheader ], [ %indvars.iv.next38, %._crit_edge9.us..preheader5.us_crit_edge ]
  %indvar = phi i32 [ 0, %.preheader5.us.preheader ], [ %11, %._crit_edge9.us..preheader5.us_crit_edge ]
  %11 = add i32 %indvar, 1
  %12 = zext i32 %11 to i64
  %13 = zext i2 %indvars.iv67 to i64
  %14 = add nuw nsw i64 %13, 4294967295
  %15 = and i64 %14, 4294967295
  %16 = add nuw nsw i64 %15, 1
  %17 = icmp slt i64 %indvars.iv49, 0
  br i1 %17, label %._crit_edge9.us, label %.lr.ph.us

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new.preheader103, %.lr.ph.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.us.new ], [ %indvars.iv.ph, %.lr.ph.us.new.preheader103 ]
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv49, i64 %indvars.iv
  %19 = load double, double* %18, align 8
  %20 = fmul double %19, %3
  store double %20, double* %18, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv49, i64 %indvars.iv.next
  %22 = load double, double* %21, align 8
  %23 = fmul double %22, %3
  store double %23, double* %21, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv49, i64 %indvars.iv.next.1
  %25 = load double, double* %24, align 8
  %26 = fmul double %25, %3
  store double %26, double* %24, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv49, i64 %indvars.iv.next.2
  %28 = load double, double* %27, align 8
  %29 = fmul double %28, %3
  store double %29, double* %27, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %.preheader.lr.ph.us.loopexit, label %.lr.ph.us.new, !llvm.loop !1

.preheader.us21:                                  ; preds = %._crit_edge.us24, %.preheader.us21.preheader
  %indvars.iv45 = phi i64 [ %indvars.iv.next46, %._crit_edge.us24 ], [ 0, %.preheader.us21.preheader ]
  %30 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv49, i64 %indvars.iv45
  br i1 %lcmp.mod43, label %.prol.loopexit41, label %.prol.preheader40

.prol.preheader40:                                ; preds = %.preheader.us21
  %31 = load double, double* %30, align 8
  %32 = fmul double %31, %2
  %33 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 0, i64 %indvars.iv45
  %34 = load double, double* %33, align 8
  %35 = fmul double %32, %34
  %36 = load double, double* %82, align 8
  %37 = fadd double %35, %36
  store double %37, double* %82, align 8
  br label %.prol.loopexit41

.prol.loopexit41:                                 ; preds = %.preheader.us21, %.prol.preheader40
  %indvars.iv35.unr.ph = phi i64 [ 1, %.prol.preheader40 ], [ 0, %.preheader.us21 ]
  br i1 %81, label %._crit_edge.us24, label %.preheader.us21.new.preheader

.preheader.us21.new.preheader:                    ; preds = %.prol.loopexit41
  br label %.preheader.us21.new

.preheader.us21.new:                              ; preds = %.preheader.us21.new.preheader, %.preheader.us21.new
  %indvars.iv35 = phi i64 [ %indvars.iv.next36.1, %.preheader.us21.new ], [ %indvars.iv35.unr.ph, %.preheader.us21.new.preheader ]
  %38 = load double, double* %30, align 8
  %39 = fmul double %38, %2
  %40 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv35, i64 %indvars.iv45
  %41 = load double, double* %40, align 8
  %42 = fmul double %39, %41
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv49, i64 %indvars.iv35
  %44 = load double, double* %43, align 8
  %45 = fadd double %42, %44
  store double %45, double* %43, align 8
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %46 = load double, double* %30, align 8
  %47 = fmul double %46, %2
  %48 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv.next36, i64 %indvars.iv45
  %49 = load double, double* %48, align 8
  %50 = fmul double %47, %49
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv49, i64 %indvars.iv.next36
  %52 = load double, double* %51, align 8
  %53 = fadd double %50, %52
  store double %53, double* %51, align 8
  %indvars.iv.next36.1 = add nuw nsw i64 %indvars.iv35, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next36.1, %wide.trip.count39.1
  br i1 %exitcond.1, label %._crit_edge.us24.loopexit, label %.preheader.us21.new

.lr.ph.us:                                        ; preds = %.preheader5.us
  %xtraiter = and i32 %11, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv49, i64 %indvars.iv.prol
  %55 = load double, double* %54, align 8
  %56 = fmul double %55, %3
  store double %56, double* %54, align 8
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !5

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph.us
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph.us ], [ %16, %.prol.loopexit.loopexit ]
  %57 = icmp ult i32 %indvar, 3
  br i1 %57, label %.preheader.lr.ph.us, label %.lr.ph.us.new.preheader

.lr.ph.us.new.preheader:                          ; preds = %.prol.loopexit
  %wide.trip.count.3 = zext i32 %indvars.iv37 to i64
  %58 = add nsw i64 %12, -4
  %59 = sub nsw i64 %58, %indvars.iv.unr
  %60 = lshr i64 %59, 2
  %61 = add nuw nsw i64 %60, 1
  %min.iters.check80 = icmp ult i64 %61, 2
  br i1 %min.iters.check80, label %.lr.ph.us.new.preheader103, label %min.iters.checked81

.lr.ph.us.new.preheader103:                       ; preds = %middle.block78, %min.iters.checked81, %.lr.ph.us.new.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked81 ], [ %indvars.iv.unr, %.lr.ph.us.new.preheader ], [ %ind.end89, %middle.block78 ]
  br label %.lr.ph.us.new

min.iters.checked81:                              ; preds = %.lr.ph.us.new.preheader
  %n.mod.vf82 = and i64 %61, 1
  %n.vec83 = sub nsw i64 %61, %n.mod.vf82
  %cmp.zero84 = icmp eq i64 %n.vec83, 0
  %62 = add nsw i64 %indvars.iv.unr, 4
  %63 = shl nuw i64 %60, 2
  %64 = add i64 %62, %63
  %65 = shl nuw nsw i64 %n.mod.vf82, 2
  %ind.end89 = sub i64 %64, %65
  br i1 %cmp.zero84, label %.lr.ph.us.new.preheader103, label %vector.ph85

vector.ph85:                                      ; preds = %min.iters.checked81
  br label %vector.body77

vector.body77:                                    ; preds = %vector.body77, %vector.ph85
  %index86 = phi i64 [ 0, %vector.ph85 ], [ %index.next87, %vector.body77 ]
  %66 = shl i64 %index86, 2
  %67 = add i64 %indvars.iv.unr, %66
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv49, i64 %67
  %69 = bitcast double* %68 to <8 x double>*
  %wide.vec95 = load <8 x double>, <8 x double>* %69, align 8
  %strided.vec96 = shufflevector <8 x double> %wide.vec95, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec97 = shufflevector <8 x double> %wide.vec95, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec98 = shufflevector <8 x double> %wide.vec95, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec99 = shufflevector <8 x double> %wide.vec95, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %70 = fmul <2 x double> %broadcast.splat101, %strided.vec96
  %71 = fmul <2 x double> %broadcast.splat101, %strided.vec97
  %72 = fmul <2 x double> %broadcast.splat101, %strided.vec98
  %73 = add nsw i64 %67, 3
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv49, i64 %73
  %75 = fmul <2 x double> %broadcast.splat101, %strided.vec99
  %76 = getelementptr double, double* %74, i64 -3
  %77 = bitcast double* %76 to <8 x double>*
  %78 = shufflevector <2 x double> %70, <2 x double> %71, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %79 = shufflevector <2 x double> %72, <2 x double> %75, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec102 = shufflevector <4 x double> %78, <4 x double> %79, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec102, <8 x double>* %77, align 8
  %index.next87 = add i64 %index86, 2
  %80 = icmp eq i64 %index.next87, %n.vec83
  br i1 %80, label %middle.block78, label %vector.body77, !llvm.loop !7

middle.block78:                                   ; preds = %vector.body77
  %cmp.n90 = icmp eq i64 %n.mod.vf82, 0
  br i1 %cmp.n90, label %.preheader.lr.ph.us, label %.lr.ph.us.new.preheader103

._crit_edge.us24.loopexit:                        ; preds = %.preheader.us21.new
  br label %._crit_edge.us24

._crit_edge.us24:                                 ; preds = %._crit_edge.us24.loopexit, %.prol.loopexit41
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond69 = icmp eq i64 %indvars.iv.next46, %10
  br i1 %exitcond69, label %._crit_edge9.us.loopexit, label %.preheader.us21

.preheader.lr.ph.us.loopexit:                     ; preds = %.lr.ph.us.new
  br label %.preheader.lr.ph.us

.preheader.lr.ph.us:                              ; preds = %.preheader.lr.ph.us.loopexit, %.prol.loopexit, %middle.block78
  br i1 false, label %.preheader.lr.ph.us.._crit_edge9.us_crit_edge, label %.preheader.us21.preheader

.preheader.lr.ph.us.._crit_edge9.us_crit_edge:    ; preds = %.preheader.lr.ph.us
  br label %._crit_edge9.us

.preheader.us21.preheader:                        ; preds = %.preheader.lr.ph.us
  %xtraiter42 = and i32 %11, 1
  %lcmp.mod43 = icmp eq i32 %xtraiter42, 0
  %81 = icmp eq i32 %indvar, 0
  %wide.trip.count39.1 = zext i32 %indvars.iv37 to i64
  %82 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv49, i64 0
  br label %.preheader.us21

._crit_edge9.us.loopexit:                         ; preds = %._crit_edge.us24
  br label %._crit_edge9.us

._crit_edge9.us:                                  ; preds = %.preheader.lr.ph.us.._crit_edge9.us_crit_edge, %._crit_edge9.us.loopexit, %.preheader5.us
  %indvars.iv.next50 = add nsw i64 %indvars.iv49, 1
  %83 = icmp slt i64 %indvars.iv.next50, %9
  br i1 %83, label %._crit_edge9.us..preheader5.us_crit_edge, label %._crit_edge14.loopexit

._crit_edge9.us..preheader5.us_crit_edge:         ; preds = %._crit_edge9.us
  %indvars.iv.next68 = add i2 %indvars.iv67, 1
  %indvars.iv.next38 = add i32 %indvars.iv37, 1
  br label %.preheader5.us

.preheader5:                                      ; preds = %.preheader5.preheader, %.preheader4..preheader5_crit_edge
  %indvars.iv70 = phi i2 [ %indvars.iv.next71, %.preheader4..preheader5_crit_edge ], [ 1, %.preheader5.preheader ]
  %indvars.iv64 = phi i64 [ %indvars.iv.next65, %.preheader4..preheader5_crit_edge ], [ 0, %.preheader5.preheader ]
  %indvar59 = phi i32 [ %84, %.preheader4..preheader5_crit_edge ], [ 0, %.preheader5.preheader ]
  %indvars.iv53 = phi i32 [ %indvars.iv.next54, %.preheader4..preheader5_crit_edge ], [ 1, %.preheader5.preheader ]
  %84 = add i32 %indvar59, 1
  %85 = zext i32 %84 to i64
  %86 = zext i2 %indvars.iv70 to i64
  %87 = add nuw nsw i64 %86, 4294967295
  %88 = and i64 %87, 4294967295
  %89 = add nuw nsw i64 %88, 1
  %90 = icmp slt i64 %indvars.iv64, 0
  br i1 %90, label %.preheader4, label %.lr.ph

.lr.ph:                                           ; preds = %.preheader5
  %xtraiter61 = and i32 %84, 3
  %lcmp.mod62 = icmp eq i32 %xtraiter61, 0
  br i1 %lcmp.mod62, label %.prol.loopexit58, label %.prol.preheader57.preheader

.prol.preheader57.preheader:                      ; preds = %.lr.ph
  br label %.prol.preheader57

.prol.preheader57:                                ; preds = %.prol.preheader57.preheader, %.prol.preheader57
  %indvars.iv51.prol = phi i64 [ %indvars.iv.next52.prol, %.prol.preheader57 ], [ 0, %.prol.preheader57.preheader ]
  %prol.iter63 = phi i32 [ %prol.iter63.sub, %.prol.preheader57 ], [ %xtraiter61, %.prol.preheader57.preheader ]
  %91 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv64, i64 %indvars.iv51.prol
  %92 = load double, double* %91, align 8
  %93 = fmul double %92, %3
  store double %93, double* %91, align 8
  %prol.iter63.sub = add nsw i32 %prol.iter63, -1
  %prol.iter63.cmp = icmp eq i32 %prol.iter63.sub, 0
  %indvars.iv.next52.prol = add nuw nsw i64 %indvars.iv51.prol, 1
  br i1 %prol.iter63.cmp, label %.prol.loopexit58.loopexit, label %.prol.preheader57, !llvm.loop !8

.prol.loopexit58.loopexit:                        ; preds = %.prol.preheader57
  br label %.prol.loopexit58

.prol.loopexit58:                                 ; preds = %.prol.loopexit58.loopexit, %.lr.ph
  %indvars.iv51.unr = phi i64 [ 0, %.lr.ph ], [ %89, %.prol.loopexit58.loopexit ]
  %94 = icmp ult i32 %indvar59, 3
  br i1 %94, label %.preheader4, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit58
  %wide.trip.count55.3 = zext i32 %indvars.iv53 to i64
  %95 = add nsw i64 %85, -4
  %96 = sub nsw i64 %95, %indvars.iv51.unr
  %97 = lshr i64 %96, 2
  %98 = add nuw nsw i64 %97, 1
  %min.iters.check = icmp ult i64 %98, 2
  br i1 %min.iters.check, label %.lr.ph.new.preheader104, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph.new.preheader
  %n.mod.vf = and i64 %98, 1
  %n.vec = sub nsw i64 %98, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %99 = add nsw i64 %indvars.iv51.unr, 4
  %100 = shl nuw i64 %97, 2
  %101 = add i64 %99, %100
  %102 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %101, %102
  br i1 %cmp.zero, label %.lr.ph.new.preheader104, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %103 = shl i64 %index, 2
  %104 = add i64 %indvars.iv51.unr, %103
  %105 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv64, i64 %104
  %106 = bitcast double* %105 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %106, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec72 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec73 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec74 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %107 = fmul <2 x double> %broadcast.splat76, %strided.vec
  %108 = fmul <2 x double> %broadcast.splat76, %strided.vec72
  %109 = fmul <2 x double> %broadcast.splat76, %strided.vec73
  %110 = add nsw i64 %104, 3
  %111 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv64, i64 %110
  %112 = fmul <2 x double> %broadcast.splat76, %strided.vec74
  %113 = getelementptr double, double* %111, i64 -3
  %114 = bitcast double* %113 to <8 x double>*
  %115 = shufflevector <2 x double> %107, <2 x double> %108, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %116 = shufflevector <2 x double> %109, <2 x double> %112, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %115, <4 x double> %116, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %114, align 8
  %index.next = add i64 %index, 2
  %117 = icmp eq i64 %index.next, %n.vec
  br i1 %117, label %middle.block, label %vector.body, !llvm.loop !9

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %.preheader4, label %.lr.ph.new.preheader104

.lr.ph.new.preheader104:                          ; preds = %middle.block, %min.iters.checked, %.lr.ph.new.preheader
  %indvars.iv51.ph = phi i64 [ %indvars.iv51.unr, %min.iters.checked ], [ %indvars.iv51.unr, %.lr.ph.new.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader104, %.lr.ph.new
  %indvars.iv51 = phi i64 [ %indvars.iv.next52.3, %.lr.ph.new ], [ %indvars.iv51.ph, %.lr.ph.new.preheader104 ]
  %118 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv64, i64 %indvars.iv51
  %119 = load double, double* %118, align 8
  %120 = fmul double %119, %3
  store double %120, double* %118, align 8
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %121 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv64, i64 %indvars.iv.next52
  %122 = load double, double* %121, align 8
  %123 = fmul double %122, %3
  store double %123, double* %121, align 8
  %indvars.iv.next52.1 = add nsw i64 %indvars.iv51, 2
  %124 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv64, i64 %indvars.iv.next52.1
  %125 = load double, double* %124, align 8
  %126 = fmul double %125, %3
  store double %126, double* %124, align 8
  %indvars.iv.next52.2 = add nsw i64 %indvars.iv51, 3
  %127 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv64, i64 %indvars.iv.next52.2
  %128 = load double, double* %127, align 8
  %129 = fmul double %128, %3
  store double %129, double* %127, align 8
  %indvars.iv.next52.3 = add nsw i64 %indvars.iv51, 4
  %exitcond56.3 = icmp eq i64 %indvars.iv.next52.3, %wide.trip.count55.3
  br i1 %exitcond56.3, label %.preheader4.loopexit, label %.lr.ph.new, !llvm.loop !10

.preheader4.loopexit:                             ; preds = %.lr.ph.new
  br label %.preheader4

.preheader4:                                      ; preds = %.preheader4.loopexit, %middle.block, %.prol.loopexit58, %.preheader5
  %indvars.iv.next65 = add nsw i64 %indvars.iv64, 1
  %130 = icmp slt i64 %indvars.iv.next65, %9
  br i1 %130, label %.preheader4..preheader5_crit_edge, label %._crit_edge14.loopexit105

.preheader4..preheader5_crit_edge:                ; preds = %.preheader4
  %indvars.iv.next71 = add i2 %indvars.iv70, 1
  %indvars.iv.next54 = add i32 %indvars.iv53, 1
  br label %.preheader5

._crit_edge14.loopexit:                           ; preds = %._crit_edge9.us
  br label %._crit_edge14

._crit_edge14.loopexit105:                        ; preds = %.preheader4
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit105, %._crit_edge14.loopexit
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %._crit_edge14
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader.lr.ph, label %._crit_edge

.preheader.lr.ph:                                 ; preds = %2
  br i1 true, label %.preheader.us.preheader, label %._crit_edge3.loopexit7

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %8 = sext i32 %0 to i64
  %9 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv9 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next10, %._crit_edge.us ]
  %10 = mul nsw i64 %8, %indvars.iv9
  br label %11

; <label>:11:                                     ; preds = %._crit_edge13, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge13 ]
  %12 = add nsw i64 %10, %indvars.iv
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 20
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %._crit_edge13

; <label>:16:                                     ; preds = %11
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %17) #5
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %11, %16
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv9, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next, %9
  br i1 %exitcond11, label %._crit_edge.us, label %11

._crit_edge.us:                                   ; preds = %._crit_edge13
  %indvars.iv.next10 = add nsw i64 %indvars.iv9, 1
  %22 = icmp slt i64 %indvars.iv.next10, %8
  br i1 %22, label %.preheader.us, label %._crit_edge3.loopexit

._crit_edge3.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge3

._crit_edge3.loopexit7:                           ; preds = %.preheader.lr.ph
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge3.loopexit7, %._crit_edge3.loopexit
  br label %._crit_edge

._crit_edge:                                      ; preds = %2, %._crit_edge3
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %25) #5
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
!1 = distinct !{!1, !2, !3, !4}
!2 = !{!"llvm.loop.unroll.runtime.disable"}
!3 = !{!"llvm.loop.vectorize.width", i32 1}
!4 = !{!"llvm.loop.interleave.count", i32 1}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.unroll.disable"}
!7 = distinct !{!7, !3, !4}
!8 = distinct !{!8, !6}
!9 = distinct !{!9, !3, !4}
!10 = distinct !{!10, !2, !3, !4}
