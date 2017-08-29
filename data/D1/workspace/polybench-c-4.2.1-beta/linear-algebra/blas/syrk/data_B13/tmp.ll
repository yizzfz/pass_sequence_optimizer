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
.preheader5.lr.ph:
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  br label %.preheader5.us

.preheader5.us:                                   ; preds = %._crit_edge15.us, %.preheader5.lr.ph
  %indvars.iv34 = phi i64 [ %indvars.iv.next35, %._crit_edge15.us ], [ 0, %.preheader5.lr.ph ]
  br label %6

; <label>:6:                                      ; preds = %6, %.preheader5.us
  %indvars.iv30 = phi i64 [ 0, %.preheader5.us ], [ %indvars.iv.next31, %6 ]
  %7 = mul nsw i64 %indvars.iv34, %indvars.iv30
  %8 = add nsw i64 %7, 1
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 1200
  %11 = sitofp i32 %10 to double
  %12 = fdiv double %11, 1.200000e+03
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv34, i64 %indvars.iv30
  store double %12, double* %13, align 8
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %exitcond33 = icmp eq i64 %indvars.iv.next31, 1000
  br i1 %exitcond33, label %._crit_edge15.us, label %6

._crit_edge15.us:                                 ; preds = %6
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next35, 1200
  br i1 %exitcond39, label %.preheader.us.preheader, label %.preheader5.us

.preheader.us.preheader:                          ; preds = %._crit_edge15.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv28 = phi i64 [ %indvars.iv.next29, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br label %14

; <label>:14:                                     ; preds = %14, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %14 ]
  %15 = mul nsw i64 %indvars.iv28, %indvars.iv
  %16 = add nsw i64 %15, 2
  %17 = trunc i64 %16 to i32
  %18 = srem i32 %17, 1000
  %19 = sitofp i32 %18 to double
  %20 = fdiv double %19, 1.000000e+03
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv28, i64 %indvars.iv
  store double %20, double* %21, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %14

._crit_edge.us:                                   ; preds = %14
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %22 = icmp slt i64 %indvars.iv.next29, 1200
  br i1 %22, label %.preheader.us, label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syrk(i32, i32, double, double, [1200 x double]* nocapture, [1000 x double]* nocapture readonly) unnamed_addr #2 {
.preheader5.lr.ph:
  %broadcast.splatinsert80 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat81 = shufflevector <2 x double> %broadcast.splatinsert80, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader5.us

.preheader5.us:                                   ; preds = %._crit_edge11.us..preheader5.us_crit_edge, %.preheader5.lr.ph
  %indvars.iv70 = phi i64 [ %indvars.iv.next71, %._crit_edge11.us..preheader5.us_crit_edge ], [ 1, %.preheader5.lr.ph ]
  %indvars.iv68 = phi i2 [ %indvars.iv.next69, %._crit_edge11.us..preheader5.us_crit_edge ], [ 1, %.preheader5.lr.ph ]
  %indvars.iv49 = phi i64 [ %indvars.iv.next50, %._crit_edge11.us..preheader5.us_crit_edge ], [ 0, %.preheader5.lr.ph ]
  %6 = add i64 %indvars.iv49, -3
  %7 = zext i2 %indvars.iv68 to i64
  %8 = add nuw nsw i64 %indvars.iv49, 1
  %xtraiter = and i64 %8, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.us.prol.loopexit, label %.lr.ph.us.prol.preheader

.lr.ph.us.prol.preheader:                         ; preds = %.preheader5.us
  br label %.lr.ph.us.prol

.lr.ph.us.prol:                                   ; preds = %.lr.ph.us.prol.preheader, %.lr.ph.us.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.lr.ph.us.prol ], [ 0, %.lr.ph.us.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph.us.prol ], [ %xtraiter, %.lr.ph.us.prol.preheader ]
  %9 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv49, i64 %indvars.iv.prol
  %10 = load double, double* %9, align 8
  %11 = fmul double %10, %3
  store double %11, double* %9, align 8
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  br i1 %prol.iter.cmp, label %.lr.ph.us.prol.loopexit.loopexit, label %.lr.ph.us.prol, !llvm.loop !1

.lr.ph.us.prol.loopexit.loopexit:                 ; preds = %.lr.ph.us.prol
  br label %.lr.ph.us.prol.loopexit

.lr.ph.us.prol.loopexit:                          ; preds = %.lr.ph.us.prol.loopexit.loopexit, %.preheader5.us
  %indvars.iv.unr = phi i64 [ 0, %.preheader5.us ], [ %7, %.lr.ph.us.prol.loopexit.loopexit ]
  %12 = icmp ult i64 %indvars.iv49, 3
  br i1 %12, label %.preheader.us23.preheader, label %.lr.ph.us.prol.loopexit..lr.ph.us_crit_edge

.lr.ph.us.prol.loopexit..lr.ph.us_crit_edge:      ; preds = %.lr.ph.us.prol.loopexit
  %13 = sub i64 %6, %indvars.iv.unr
  %14 = lshr i64 %13, 2
  %15 = add nuw nsw i64 %14, 1
  %min.iters.check = icmp ult i64 %15, 2
  br i1 %min.iters.check, label %.lr.ph.us.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph.us.prol.loopexit..lr.ph.us_crit_edge
  %n.mod.vf = and i64 %15, 1
  %n.vec = sub nsw i64 %15, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %16 = or i64 %indvars.iv.unr, 4
  %17 = shl nuw i64 %14, 2
  %18 = add i64 %16, %17
  %19 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %18, %19
  br i1 %cmp.zero, label %.lr.ph.us.preheader, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %20 = shl i64 %index, 2
  %offset.idx = or i64 %indvars.iv.unr, %20
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv49, i64 %offset.idx
  %22 = bitcast double* %21 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %22, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec77 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec78 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec79 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %23 = fmul <2 x double> %strided.vec, %broadcast.splat81
  %24 = fmul <2 x double> %strided.vec77, %broadcast.splat81
  %25 = fmul <2 x double> %strided.vec78, %broadcast.splat81
  %26 = add nsw i64 %offset.idx, 3
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv49, i64 %26
  %28 = fmul <2 x double> %strided.vec79, %broadcast.splat81
  %29 = getelementptr double, double* %27, i64 -3
  %30 = bitcast double* %29 to <8 x double>*
  %31 = shufflevector <2 x double> %23, <2 x double> %24, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %32 = shufflevector <2 x double> %25, <2 x double> %28, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %31, <4 x double> %32, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %30, align 8
  %index.next = add i64 %index, 2
  %33 = icmp eq i64 %index.next, %n.vec
  br i1 %33, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %.preheader.us23.preheader, label %.lr.ph.us.preheader

.lr.ph.us.preheader:                              ; preds = %middle.block, %min.iters.checked, %.lr.ph.us.prol.loopexit..lr.ph.us_crit_edge
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked ], [ %indvars.iv.unr, %.lr.ph.us.prol.loopexit..lr.ph.us_crit_edge ], [ %ind.end, %middle.block ]
  br label %.lr.ph.us

.lr.ph.us:                                        ; preds = %.lr.ph.us.preheader, %.lr.ph.us
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.us ], [ %indvars.iv.ph, %.lr.ph.us.preheader ]
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv49, i64 %indvars.iv
  %35 = load double, double* %34, align 8
  %36 = fmul double %35, %3
  store double %36, double* %34, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv49, i64 %indvars.iv.next
  %38 = load double, double* %37, align 8
  %39 = fmul double %38, %3
  store double %39, double* %37, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv49, i64 %indvars.iv.next.1
  %41 = load double, double* %40, align 8
  %42 = fmul double %41, %3
  store double %42, double* %40, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv49, i64 %indvars.iv.next.2
  %44 = load double, double* %43, align 8
  %45 = fmul double %44, %3
  store double %45, double* %43, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv70
  br i1 %exitcond.3, label %.preheader.us23.preheader.loopexit, label %.lr.ph.us, !llvm.loop !6

.preheader.us23:                                  ; preds = %._crit_edge.us27, %.preheader.us23.preheader
  %indvars.iv44 = phi i64 [ %indvars.iv.next45, %._crit_edge.us27 ], [ 0, %.preheader.us23.preheader ]
  br i1 %lcmp.mod61, label %.prol.preheader, label %.prol.loopexit

.prol.preheader:                                  ; preds = %.preheader.us23
  %46 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv49, i64 %indvars.iv44
  %47 = load double, double* %46, align 8
  %48 = fmul double %47, %2
  %49 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 0, i64 %indvars.iv44
  %50 = load double, double* %49, align 8
  %51 = fmul double %48, %50
  %52 = load double, double* %73, align 8
  %53 = fadd double %51, %52
  store double %53, double* %73, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.preheader.us23, %.prol.preheader
  %indvars.iv38.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader.us23 ]
  br i1 %74, label %._crit_edge.us27, label %.preheader.us23.new.preheader

.preheader.us23.new.preheader:                    ; preds = %.prol.loopexit
  %54 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv49, i64 %indvars.iv44
  %55 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv49, i64 %indvars.iv44
  br label %.preheader.us23.new

.preheader.us23.new:                              ; preds = %.preheader.us23.new, %.preheader.us23.new.preheader
  %indvars.iv38 = phi i64 [ %indvars.iv.next39.1, %.preheader.us23.new ], [ %indvars.iv38.unr.ph, %.preheader.us23.new.preheader ]
  %56 = load double, double* %54, align 8
  %57 = fmul double %56, %2
  %58 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv38, i64 %indvars.iv44
  %59 = load double, double* %58, align 8
  %60 = fmul double %57, %59
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv49, i64 %indvars.iv38
  %62 = load double, double* %61, align 8
  %63 = fadd double %60, %62
  store double %63, double* %61, align 8
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %64 = load double, double* %55, align 8
  %65 = fmul double %64, %2
  %66 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv.next39, i64 %indvars.iv44
  %67 = load double, double* %66, align 8
  %68 = fmul double %65, %67
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv49, i64 %indvars.iv.next39
  %70 = load double, double* %69, align 8
  %71 = fadd double %68, %70
  store double %71, double* %69, align 8
  %indvars.iv.next39.1 = add nuw nsw i64 %indvars.iv38, 2
  %exitcond43.1 = icmp eq i64 %indvars.iv.next39.1, %indvars.iv70
  br i1 %exitcond43.1, label %._crit_edge.us27.loopexit, label %.preheader.us23.new

._crit_edge.us27.loopexit:                        ; preds = %.preheader.us23.new
  br label %._crit_edge.us27

._crit_edge.us27:                                 ; preds = %._crit_edge.us27.loopexit, %.prol.loopexit
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %exitcond47 = icmp eq i64 %indvars.iv.next45, 1000
  br i1 %exitcond47, label %._crit_edge11.us, label %.preheader.us23

.preheader.us23.preheader.loopexit:               ; preds = %.lr.ph.us
  br label %.preheader.us23.preheader

.preheader.us23.preheader:                        ; preds = %.preheader.us23.preheader.loopexit, %middle.block, %.lr.ph.us.prol.loopexit
  %72 = and i64 %indvars.iv49, 1
  %lcmp.mod61 = icmp eq i64 %72, 0
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv49, i64 0
  %74 = icmp eq i64 %indvars.iv49, 0
  br label %.preheader.us23

._crit_edge11.us:                                 ; preds = %._crit_edge.us27
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %exitcond = icmp eq i64 %indvars.iv.next50, 1200
  br i1 %exitcond, label %._crit_edge16, label %._crit_edge11.us..preheader5.us_crit_edge

._crit_edge11.us..preheader5.us_crit_edge:        ; preds = %._crit_edge11.us
  %indvars.iv.next69 = add i2 %indvars.iv68, 1
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1
  br label %.preheader5.us

._crit_edge16:                                    ; preds = %._crit_edge11.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
.preheader.us.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv11 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next12, %._crit_edge.us ]
  %6 = mul nsw i64 %indvars.iv11, 1200
  br label %7

; <label>:7:                                      ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %8 = add nsw i64 %6, %indvars.iv
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %7, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv11, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %7

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next12, 1200
  br i1 %exitcond13, label %._crit_edge4, label %.preheader.us

._crit_edge4:                                     ; preds = %._crit_edge.us
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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}
