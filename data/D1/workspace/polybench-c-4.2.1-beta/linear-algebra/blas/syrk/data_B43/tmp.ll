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
  %18 = bitcast i8* %5 to [1200 x double]*
  call fastcc void @print_array(i32 1200, [1200 x double]* %18)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, double* nocapture, [1200 x double]* nocapture, [1000 x double]* nocapture) unnamed_addr #2 {
.preheader5.lr.ph:
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  br label %.preheader5.us

.preheader5.us:                                   ; preds = %._crit_edge13.us, %.preheader5.lr.ph
  %indvars.iv32 = phi i64 [ 0, %.preheader5.lr.ph ], [ %indvars.iv.next33, %._crit_edge13.us ]
  br label %6

; <label>:6:                                      ; preds = %6, %.preheader5.us
  %indvars.iv28 = phi i64 [ 0, %.preheader5.us ], [ %indvars.iv.next29, %6 ]
  %7 = mul nsw i64 %indvars.iv28, %indvars.iv32
  %8 = add nsw i64 %7, 1
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 1200
  %11 = sitofp i32 %10 to double
  %12 = fdiv double %11, 1.200000e+03
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv32, i64 %indvars.iv28
  store double %12, double* %13, align 8
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next29, 1000
  br i1 %exitcond42, label %._crit_edge13.us, label %6

._crit_edge13.us:                                 ; preds = %6
  %indvars.iv.next33 = add nsw i64 %indvars.iv32, 1
  %14 = icmp slt i64 %indvars.iv.next33, 1200
  br i1 %14, label %.preheader5.us, label %.preheader.us.preheader

.preheader.us.preheader:                          ; preds = %._crit_edge13.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv26 = phi i64 [ %indvars.iv.next27, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br label %15

; <label>:15:                                     ; preds = %15, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %15 ]
  %16 = mul nsw i64 %indvars.iv, %indvars.iv26
  %17 = add nsw i64 %16, 2
  %18 = trunc i64 %17 to i32
  %19 = srem i32 %18, 1000
  %20 = sitofp i32 %19 to double
  %21 = fdiv double %20, 1.000000e+03
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv26, i64 %indvars.iv
  store double %21, double* %22, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond40 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond40, label %._crit_edge.us, label %15

._crit_edge.us:                                   ; preds = %15
  %indvars.iv.next27 = add nsw i64 %indvars.iv26, 1
  %23 = icmp slt i64 %indvars.iv.next27, 1200
  br i1 %23, label %.preheader.us, label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syrk(i32, i32, double, double, [1200 x double]* nocapture, [1000 x double]* nocapture readonly) unnamed_addr #2 {
.preheader5.lr.ph:
  %broadcast.splatinsert101 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat102 = shufflevector <2 x double> %broadcast.splatinsert101, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader5.us

.preheader5.us:                                   ; preds = %._crit_edge9.us..preheader5.us_crit_edge, %.preheader5.lr.ph
  %indvars.iv68 = phi i2 [ 1, %.preheader5.lr.ph ], [ %indvars.iv.next69, %._crit_edge9.us..preheader5.us_crit_edge ]
  %indvars.iv49 = phi i64 [ 0, %.preheader5.lr.ph ], [ %indvars.iv.next50, %._crit_edge9.us..preheader5.us_crit_edge ]
  %indvars.iv37 = phi i32 [ 1, %.preheader5.lr.ph ], [ %indvars.iv.next38, %._crit_edge9.us..preheader5.us_crit_edge ]
  %indvar = phi i32 [ 0, %.preheader5.lr.ph ], [ %12, %._crit_edge9.us..preheader5.us_crit_edge ]
  %6 = add i64 %indvars.iv49, 1
  %7 = and i64 %6, 4294967295
  %8 = zext i2 %indvars.iv68 to i64
  %9 = add nuw nsw i64 %8, 4294967295
  %10 = and i64 %9, 4294967295
  %11 = add nuw nsw i64 %10, 1
  %12 = add i32 %indvar, 1
  %13 = icmp slt i64 %indvars.iv49, 0
  br i1 %13, label %._crit_edge9.us, label %.lr.ph.us

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new.preheader104, %.lr.ph.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.us.new ], [ %indvars.iv.ph, %.lr.ph.us.new.preheader104 ]
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv49, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = fmul double %15, %3
  store double %16, double* %14, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv49, i64 %indvars.iv.next
  %18 = load double, double* %17, align 8
  %19 = fmul double %18, %3
  store double %19, double* %17, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv49, i64 %indvars.iv.next.1
  %21 = load double, double* %20, align 8
  %22 = fmul double %21, %3
  store double %22, double* %20, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv49, i64 %indvars.iv.next.2
  %24 = load double, double* %23, align 8
  %25 = fmul double %24, %3
  store double %25, double* %23, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %.preheader.us22.preheader.loopexit, label %.lr.ph.us.new, !llvm.loop !1

.preheader.us22.new:                              ; preds = %.preheader.us22.new.preheader, %.preheader.us22.new
  %indvars.iv35 = phi i64 [ %indvars.iv.next36.1, %.preheader.us22.new ], [ %indvars.iv35.unr.ph, %.preheader.us22.new.preheader ]
  %26 = load double, double* %42, align 8
  %27 = fmul double %26, %2
  %28 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv35, i64 %indvars.iv45
  %29 = load double, double* %28, align 8
  %30 = fmul double %27, %29
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv49, i64 %indvars.iv35
  %32 = load double, double* %31, align 8
  %33 = fadd double %30, %32
  store double %33, double* %31, align 8
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %34 = load double, double* %42, align 8
  %35 = fmul double %34, %2
  %36 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv.next36, i64 %indvars.iv45
  %37 = load double, double* %36, align 8
  %38 = fmul double %35, %37
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv49, i64 %indvars.iv.next36
  %40 = load double, double* %39, align 8
  %41 = fadd double %38, %40
  store double %41, double* %39, align 8
  %indvars.iv.next36.1 = add nuw nsw i64 %indvars.iv35, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next36.1, %wide.trip.count39.1
  br i1 %exitcond.1, label %._crit_edge.us24.loopexit, label %.preheader.us22.new

.preheader.us22:                                  ; preds = %._crit_edge.us24, %.preheader.us22.preheader
  %indvars.iv45 = phi i64 [ %indvars.iv.next46, %._crit_edge.us24 ], [ 0, %.preheader.us22.preheader ]
  %42 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv49, i64 %indvars.iv45
  br i1 %78, label %.prol.loopexit41, label %.prol.preheader40

.prol.preheader40:                                ; preds = %.preheader.us22
  %43 = load double, double* %42, align 8
  %44 = fmul double %43, %2
  %45 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 0, i64 %indvars.iv45
  %46 = load double, double* %45, align 8
  %47 = fmul double %44, %46
  %48 = load double, double* %77, align 8
  %49 = fadd double %47, %48
  store double %49, double* %77, align 8
  br label %.prol.loopexit41

.prol.loopexit41:                                 ; preds = %.preheader.us22, %.prol.preheader40
  %indvars.iv35.unr.ph = phi i64 [ 1, %.prol.preheader40 ], [ 0, %.preheader.us22 ]
  br i1 %79, label %._crit_edge.us24, label %.preheader.us22.new.preheader

.preheader.us22.new.preheader:                    ; preds = %.prol.loopexit41
  br label %.preheader.us22.new

.lr.ph.us:                                        ; preds = %.preheader5.us
  %xtraiter = and i32 %12, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv49, i64 %indvars.iv.prol
  %51 = load double, double* %50, align 8
  %52 = fmul double %51, %3
  store double %52, double* %50, align 8
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !5

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph.us
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph.us ], [ %11, %.prol.loopexit.loopexit ]
  %53 = icmp ult i32 %indvar, 3
  br i1 %53, label %.preheader.us22.preheader, label %.lr.ph.us.new.preheader

.lr.ph.us.new.preheader:                          ; preds = %.prol.loopexit
  %wide.trip.count.3 = zext i32 %indvars.iv37 to i64
  %54 = add nsw i64 %7, -4
  %55 = sub nsw i64 %54, %indvars.iv.unr
  %56 = lshr i64 %55, 2
  %57 = add nuw nsw i64 %56, 1
  %min.iters.check81 = icmp ult i64 %57, 2
  br i1 %min.iters.check81, label %.lr.ph.us.new.preheader104, label %min.iters.checked82

.lr.ph.us.new.preheader104:                       ; preds = %middle.block79, %min.iters.checked82, %.lr.ph.us.new.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked82 ], [ %indvars.iv.unr, %.lr.ph.us.new.preheader ], [ %ind.end90, %middle.block79 ]
  br label %.lr.ph.us.new

min.iters.checked82:                              ; preds = %.lr.ph.us.new.preheader
  %n.mod.vf83 = and i64 %57, 1
  %n.vec84 = sub nsw i64 %57, %n.mod.vf83
  %cmp.zero85 = icmp eq i64 %n.vec84, 0
  %58 = add nsw i64 %indvars.iv.unr, 4
  %59 = shl nuw i64 %56, 2
  %60 = add i64 %58, %59
  %61 = shl nuw nsw i64 %n.mod.vf83, 2
  %ind.end90 = sub i64 %60, %61
  br i1 %cmp.zero85, label %.lr.ph.us.new.preheader104, label %vector.ph86

vector.ph86:                                      ; preds = %min.iters.checked82
  br label %vector.body78

vector.body78:                                    ; preds = %vector.body78, %vector.ph86
  %index87 = phi i64 [ 0, %vector.ph86 ], [ %index.next88, %vector.body78 ]
  %62 = shl i64 %index87, 2
  %63 = add i64 %indvars.iv.unr, %62
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv49, i64 %63
  %65 = bitcast double* %64 to <8 x double>*
  %wide.vec96 = load <8 x double>, <8 x double>* %65, align 8
  %strided.vec97 = shufflevector <8 x double> %wide.vec96, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec98 = shufflevector <8 x double> %wide.vec96, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec99 = shufflevector <8 x double> %wide.vec96, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec100 = shufflevector <8 x double> %wide.vec96, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %66 = fmul <2 x double> %broadcast.splat102, %strided.vec97
  %67 = fmul <2 x double> %broadcast.splat102, %strided.vec98
  %68 = fmul <2 x double> %broadcast.splat102, %strided.vec99
  %69 = add nsw i64 %63, 3
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv49, i64 %69
  %71 = fmul <2 x double> %broadcast.splat102, %strided.vec100
  %72 = getelementptr double, double* %70, i64 -3
  %73 = bitcast double* %72 to <8 x double>*
  %74 = shufflevector <2 x double> %66, <2 x double> %67, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %75 = shufflevector <2 x double> %68, <2 x double> %71, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec103 = shufflevector <4 x double> %74, <4 x double> %75, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec103, <8 x double>* %73, align 8
  %index.next88 = add i64 %index87, 2
  %76 = icmp eq i64 %index.next88, %n.vec84
  br i1 %76, label %middle.block79, label %vector.body78, !llvm.loop !7

middle.block79:                                   ; preds = %vector.body78
  %cmp.n91 = icmp eq i64 %n.mod.vf83, 0
  br i1 %cmp.n91, label %.preheader.us22.preheader, label %.lr.ph.us.new.preheader104

._crit_edge.us24.loopexit:                        ; preds = %.preheader.us22.new
  br label %._crit_edge.us24

._crit_edge.us24:                                 ; preds = %._crit_edge.us24.loopexit, %.prol.loopexit41
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond = icmp eq i64 %indvars.iv.next46, 1000
  br i1 %exitcond, label %._crit_edge9.us.loopexit, label %.preheader.us22

.preheader.us22.preheader.loopexit:               ; preds = %.lr.ph.us.new
  br label %.preheader.us22.preheader

.preheader.us22.preheader:                        ; preds = %.preheader.us22.preheader.loopexit, %middle.block79, %.prol.loopexit
  %xtraiter42 = and i32 %12, 1
  %wide.trip.count39.1 = zext i32 %indvars.iv37 to i64
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv49, i64 0
  %78 = icmp eq i32 %xtraiter42, 0
  %79 = icmp eq i32 %indvar, 0
  br label %.preheader.us22

._crit_edge9.us.loopexit:                         ; preds = %._crit_edge.us24
  br label %._crit_edge9.us

._crit_edge9.us:                                  ; preds = %._crit_edge9.us.loopexit, %.preheader5.us
  %indvars.iv.next50 = add nsw i64 %indvars.iv49, 1
  %80 = icmp slt i64 %indvars.iv.next50, 1200
  br i1 %80, label %._crit_edge9.us..preheader5.us_crit_edge, label %._crit_edge14

._crit_edge9.us..preheader5.us_crit_edge:         ; preds = %._crit_edge9.us
  %indvars.iv.next69 = add i2 %indvars.iv68, 1
  %indvars.iv.next38 = add i32 %indvars.iv37, 1
  br label %.preheader5.us

._crit_edge14:                                    ; preds = %._crit_edge9.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
.preheader.lr.ph:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv9 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next10, %._crit_edge.us ]
  %6 = mul nsw i64 %indvars.iv9, 1200
  br label %7

; <label>:7:                                      ; preds = %._crit_edge15, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge15 ]
  %8 = add nsw i64 %6, %indvars.iv
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge15

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %7, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv9, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %7

._crit_edge.us:                                   ; preds = %._crit_edge15
  %indvars.iv.next10 = add nsw i64 %indvars.iv9, 1
  %18 = icmp slt i64 %indvars.iv.next10, 1200
  br i1 %18, label %.preheader.us, label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge.us
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
!1 = distinct !{!1, !2, !3, !4}
!2 = !{!"llvm.loop.unroll.runtime.disable"}
!3 = !{!"llvm.loop.vectorize.width", i32 1}
!4 = !{!"llvm.loop.interleave.count", i32 1}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.unroll.disable"}
!7 = distinct !{!7, !3, !4}
