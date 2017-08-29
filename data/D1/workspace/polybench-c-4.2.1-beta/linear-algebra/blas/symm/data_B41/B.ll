; ModuleID = 'A.ll'
source_filename = "symm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %8 = bitcast i8* %5 to [1200 x double]*
  %9 = bitcast i8* %6 to [1000 x double]*
  %10 = bitcast i8* %7 to [1200 x double]*
  call void @init_array(i32 1000, i32 1200, double* nonnull %3, double* nonnull %4, [1200 x double]* %8, [1000 x double]* %9, [1200 x double]* %10)
  call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  call void @kernel_symm(i32 1000, i32 1200, double %11, double %12, [1200 x double]* %8, [1000 x double]* %9, [1200 x double]* %10)
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
  call void @print_array(i32 1000, i32 1200, [1200 x double]* %8)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, double*, double*, [1200 x double]*, [1000 x double]*, [1200 x double]*) #2 {
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %._crit_edge.preheader.lr.ph, label %._crit_edge39._crit_edge

._crit_edge.preheader.lr.ph:                      ; preds = %7
  %9 = icmp sgt i32 %1, 0
  %10 = sitofp i32 %0 to double
  br i1 %9, label %._crit_edge.preheader.us.preheader, label %._crit_edge.preheader.lr.ph.._crit_edge40.preheader.lr.ph_crit_edge

._crit_edge.preheader.lr.ph.._crit_edge40.preheader.lr.ph_crit_edge: ; preds = %._crit_edge.preheader.lr.ph
  %.pre = zext i32 %0 to i64
  br label %._crit_edge40.preheader.lr.ph

._crit_edge.preheader.us.preheader:               ; preds = %._crit_edge.preheader.lr.ph
  %11 = zext i32 %1 to i64
  %wide.trip.count71 = zext i32 %0 to i64
  br label %._crit_edge.preheader.us

._crit_edge.preheader.us:                         ; preds = %._crit_edge._crit_edge.us, %._crit_edge.preheader.us.preheader
  %indvars.iv69 = phi i64 [ 0, %._crit_edge.preheader.us.preheader ], [ %indvars.iv.next70, %._crit_edge._crit_edge.us ]
  %12 = add i64 %indvars.iv69, %11
  %13 = trunc i64 %12 to i32
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us, %._crit_edge.preheader.us
  %indvars.iv66 = phi i64 [ 0, %._crit_edge.preheader.us ], [ %indvars.iv.next67, %._crit_edge.us ]
  %14 = add nuw nsw i64 %indvars.iv66, %indvars.iv69
  %15 = trunc i64 %14 to i32
  %16 = srem i32 %15, 100
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, %10
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv69, i64 %indvars.iv66
  store double %18, double* %19, align 8
  %20 = trunc i64 %indvars.iv66 to i32
  %21 = sub i32 %13, %20
  %22 = srem i32 %21, 100
  %23 = sitofp i32 %22 to double
  %24 = fdiv double %23, %10
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv69, i64 %indvars.iv66
  store double %24, double* %25, align 8
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %exitcond68 = icmp eq i64 %indvars.iv.next67, %11
  br i1 %exitcond68, label %._crit_edge._crit_edge.us, label %._crit_edge.us

._crit_edge._crit_edge.us:                        ; preds = %._crit_edge.us
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %exitcond72 = icmp eq i64 %indvars.iv.next70, %wide.trip.count71
  br i1 %exitcond72, label %._crit_edge40.preheader.lr.ph.loopexit, label %._crit_edge.preheader.us

._crit_edge40.preheader.lr.ph.loopexit:           ; preds = %._crit_edge._crit_edge.us
  br label %._crit_edge40.preheader.lr.ph

._crit_edge40.preheader.lr.ph:                    ; preds = %._crit_edge40.preheader.lr.ph.loopexit, %._crit_edge.preheader.lr.ph.._crit_edge40.preheader.lr.ph_crit_edge
  %wide.trip.count56.7.pre-phi = phi i64 [ %.pre, %._crit_edge.preheader.lr.ph.._crit_edge40.preheader.lr.ph_crit_edge ], [ %wide.trip.count71, %._crit_edge40.preheader.lr.ph.loopexit ]
  %26 = add i32 %0, 7
  %27 = add i32 %0, -2
  %28 = sext i32 %0 to i64
  %29 = add nsw i64 %wide.trip.count56.7.pre-phi, -8
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge40.preheader.lr.ph, %._crit_edge39
  %indvars.iv63 = phi i64 [ 0, %._crit_edge40.preheader.lr.ph ], [ %indvars.iv.next64, %._crit_edge39 ]
  %indvars.iv61 = phi i64 [ 1, %._crit_edge40.preheader.lr.ph ], [ %indvars.iv.next62, %._crit_edge39 ]
  %30 = sub nsw i64 0, %indvars.iv63
  %31 = trunc i64 %30 to i32
  %32 = add i32 %26, %31
  %33 = add i32 %27, %31
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %xtraiter74 = and i64 %indvars.iv.next64, 1
  %lcmp.mod = icmp eq i64 %xtraiter74, 0
  br i1 %lcmp.mod, label %._crit_edge40.prol.loopexit, label %._crit_edge40.prol

._crit_edge40.prol:                               ; preds = %.lr.ph
  %34 = trunc i64 %indvars.iv63 to i32
  %35 = srem i32 %34, 100
  %36 = sitofp i32 %35 to double
  %37 = fdiv double %36, %10
  %38 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv63, i64 0
  store double %37, double* %38, align 8
  br label %._crit_edge40.prol.loopexit

._crit_edge40.prol.loopexit:                      ; preds = %._crit_edge40.prol, %.lr.ph
  %indvars.iv.unr.ph = phi i64 [ 1, %._crit_edge40.prol ], [ 0, %.lr.ph ]
  %39 = icmp eq i64 %indvars.iv63, 0
  br i1 %39, label %.preheader, label %._crit_edge40.preheader

._crit_edge40.preheader:                          ; preds = %._crit_edge40.prol.loopexit
  br label %._crit_edge40

.preheader.loopexit:                              ; preds = %._crit_edge40
  br label %.preheader

.preheader:                                       ; preds = %.preheader.loopexit, %._crit_edge40.prol.loopexit
  %40 = icmp slt i64 %indvars.iv.next64, %28
  br i1 %40, label %.lr.ph42, label %._crit_edge39

.lr.ph42:                                         ; preds = %.preheader
  %xtraiter57 = and i32 %32, 7
  %lcmp.mod58 = icmp eq i32 %xtraiter57, 0
  br i1 %lcmp.mod58, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph42
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv54.prol = phi i64 [ %indvars.iv.next55.prol, %.prol.preheader ], [ %indvars.iv61, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter57, %.prol.preheader.preheader ]
  %41 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv63, i64 %indvars.iv54.prol
  store double -9.990000e+02, double* %41, align 8
  %indvars.iv.next55.prol = add nuw nsw i64 %indvars.iv54.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !1

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph42
  %indvars.iv54.unr = phi i64 [ %indvars.iv61, %.lr.ph42 ], [ %indvars.iv.next55.prol, %.prol.loopexit.loopexit ]
  %42 = icmp ult i32 %33, 7
  br i1 %42, label %._crit_edge39, label %.lr.ph42.new.preheader

.lr.ph42.new.preheader:                           ; preds = %.prol.loopexit
  %43 = sub i64 %29, %indvars.iv54.unr
  %44 = lshr i64 %43, 3
  %45 = add nuw nsw i64 %44, 1
  %min.iters.check = icmp ult i64 %45, 2
  br i1 %min.iters.check, label %.lr.ph42.new.preheader76, label %min.iters.checked

.lr.ph42.new.preheader76:                         ; preds = %middle.block, %min.iters.checked, %.lr.ph42.new.preheader
  %indvars.iv54.ph = phi i64 [ %indvars.iv54.unr, %min.iters.checked ], [ %indvars.iv54.unr, %.lr.ph42.new.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph42.new

min.iters.checked:                                ; preds = %.lr.ph42.new.preheader
  %n.mod.vf = and i64 %45, 1
  %n.vec = sub nsw i64 %45, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %46 = add i64 %indvars.iv54.unr, 8
  %47 = shl nuw i64 %44, 3
  %48 = add i64 %46, %47
  %49 = shl nuw nsw i64 %n.mod.vf, 3
  %ind.end = sub i64 %48, %49
  br i1 %cmp.zero, label %.lr.ph42.new.preheader76, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %50 = shl i64 %index, 3
  %51 = add i64 %indvars.iv54.unr, %50
  %52 = add nsw i64 %51, 7
  %53 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv63, i64 %52
  %54 = getelementptr double, double* %53, i64 -7
  %55 = bitcast double* %54 to <16 x double>*
  store <16 x double> <double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02>, <16 x double>* %55, align 8
  %index.next = add i64 %index, 2
  %56 = icmp eq i64 %index.next, %n.vec
  br i1 %56, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge39, label %.lr.ph42.new.preheader76

._crit_edge40:                                    ; preds = %._crit_edge40.preheader, %._crit_edge40
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %._crit_edge40 ], [ %indvars.iv.unr.ph, %._crit_edge40.preheader ]
  %57 = add nuw nsw i64 %indvars.iv, %indvars.iv63
  %58 = trunc i64 %57 to i32
  %59 = srem i32 %58, 100
  %60 = sitofp i32 %59 to double
  %61 = fdiv double %60, %10
  %62 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv63, i64 %indvars.iv
  store double %61, double* %62, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %63 = add nuw nsw i64 %indvars.iv.next, %indvars.iv63
  %64 = trunc i64 %63 to i32
  %65 = srem i32 %64, 100
  %66 = sitofp i32 %65 to double
  %67 = fdiv double %66, %10
  %68 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv63, i64 %indvars.iv.next
  store double %67, double* %68, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv61
  br i1 %exitcond.1, label %.preheader.loopexit, label %._crit_edge40

.lr.ph42.new:                                     ; preds = %.lr.ph42.new.preheader76, %.lr.ph42.new
  %indvars.iv54 = phi i64 [ %indvars.iv.next55.7, %.lr.ph42.new ], [ %indvars.iv54.ph, %.lr.ph42.new.preheader76 ]
  %69 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv63, i64 %indvars.iv54
  store double -9.990000e+02, double* %69, align 8
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %70 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv63, i64 %indvars.iv.next55
  store double -9.990000e+02, double* %70, align 8
  %indvars.iv.next55.1 = add nsw i64 %indvars.iv54, 2
  %71 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv63, i64 %indvars.iv.next55.1
  store double -9.990000e+02, double* %71, align 8
  %indvars.iv.next55.2 = add nsw i64 %indvars.iv54, 3
  %72 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv63, i64 %indvars.iv.next55.2
  store double -9.990000e+02, double* %72, align 8
  %indvars.iv.next55.3 = add nsw i64 %indvars.iv54, 4
  %73 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv63, i64 %indvars.iv.next55.3
  store double -9.990000e+02, double* %73, align 8
  %indvars.iv.next55.4 = add nsw i64 %indvars.iv54, 5
  %74 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv63, i64 %indvars.iv.next55.4
  store double -9.990000e+02, double* %74, align 8
  %indvars.iv.next55.5 = add nsw i64 %indvars.iv54, 6
  %75 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv63, i64 %indvars.iv.next55.5
  store double -9.990000e+02, double* %75, align 8
  %indvars.iv.next55.6 = add nsw i64 %indvars.iv54, 7
  %76 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv63, i64 %indvars.iv.next55.6
  store double -9.990000e+02, double* %76, align 8
  %indvars.iv.next55.7 = add nsw i64 %indvars.iv54, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next55.7, %wide.trip.count56.7.pre-phi
  br i1 %exitcond.7, label %._crit_edge39.loopexit, label %.lr.ph42.new, !llvm.loop !6

._crit_edge39.loopexit:                           ; preds = %.lr.ph42.new
  br label %._crit_edge39

._crit_edge39:                                    ; preds = %._crit_edge39.loopexit, %middle.block, %.prol.loopexit, %.preheader
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond = icmp eq i64 %indvars.iv.next64, %wide.trip.count56.7.pre-phi
  br i1 %exitcond, label %._crit_edge39._crit_edge.loopexit, label %.lr.ph

._crit_edge39._crit_edge.loopexit:                ; preds = %._crit_edge39
  br label %._crit_edge39._crit_edge

._crit_edge39._crit_edge:                         ; preds = %._crit_edge39._crit_edge.loopexit, %7
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_symm(i32, i32, double, double, [1200 x double]*, [1000 x double]*, [1200 x double]*) #2 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %._crit_edge.preheader.lr.ph, label %._crit_edge55

._crit_edge.preheader.lr.ph:                      ; preds = %7
  %9 = icmp sgt i32 %1, 0
  %wide.trip.count65 = zext i32 %1 to i64
  %10 = fmul double %2, 0.000000e+00
  %wide.trip.count69 = zext i32 %0 to i64
  %11 = add nsw i64 %wide.trip.count65, -1
  %min.iters.check = icmp ult i32 %1, 4
  %12 = and i32 %1, 3
  %n.mod.vf = zext i32 %12 to i64
  %n.vec = sub nsw i64 %wide.trip.count65, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %broadcast.splatinsert86 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat87 = shufflevector <2 x double> %broadcast.splatinsert86, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert90 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat91 = shufflevector <2 x double> %broadcast.splatinsert90, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert92 = insertelement <2 x double> undef, double %10, i32 0
  %broadcast.splat93 = shufflevector <2 x double> %broadcast.splatinsert92, <2 x double> undef, <2 x i32> zeroinitializer
  %cmp.n = icmp eq i32 %12, 0
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %._crit_edge._crit_edge, %._crit_edge.preheader.lr.ph
  %indvars.iv67 = phi i64 [ 0, %._crit_edge.preheader.lr.ph ], [ %indvars.iv.next68, %._crit_edge._crit_edge ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv67, i64 0
  %scevgep74 = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv67, i64 %wide.trip.count65
  %scevgep76 = getelementptr [1200 x double], [1200 x double]* %6, i64 %indvars.iv67, i64 0
  %scevgep78 = getelementptr [1200 x double], [1200 x double]* %6, i64 %indvars.iv67, i64 %wide.trip.count65
  br i1 %9, label %._crit_edge44.preheader.lr.ph, label %._crit_edge._crit_edge

._crit_edge44.preheader.lr.ph:                    ; preds = %._crit_edge.preheader
  %13 = icmp sgt i64 %indvars.iv67, 0
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv67, i64 %indvars.iv67
  br i1 %13, label %._crit_edge44.preheader.us.preheader, label %._crit_edge44.preheader.preheader

._crit_edge44.preheader.us.preheader:             ; preds = %._crit_edge44.preheader.lr.ph
  br label %._crit_edge44.preheader.us

._crit_edge44.preheader.preheader:                ; preds = %._crit_edge44.preheader.lr.ph
  br i1 %min.iters.check, label %._crit_edge44.preheader.preheader94, label %min.iters.checked

._crit_edge44.preheader.preheader94:              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %._crit_edge44.preheader.preheader
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %._crit_edge44.preheader.preheader ], [ %n.vec, %middle.block ]
  %15 = sub nsw i64 %wide.trip.count65, %indvars.iv.ph
  %xtraiter = and i64 %15, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge44.preheader.prol.loopexit.unr-lcssa, label %._crit_edge44.preheader.prol.preheader

._crit_edge44.preheader.prol.preheader:           ; preds = %._crit_edge44.preheader.preheader94
  br label %._crit_edge44.preheader.prol

._crit_edge44.preheader.prol:                     ; preds = %._crit_edge44.preheader.prol.preheader
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv67, i64 %indvars.iv.ph
  %17 = load double, double* %16, align 8
  %18 = fmul double %17, %3
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv67, i64 %indvars.iv.ph
  %20 = load double, double* %19, align 8
  %21 = fmul double %20, %2
  %22 = load double, double* %14, align 8
  %23 = fmul double %21, %22
  %24 = fadd double %18, %23
  %25 = fadd double %10, %24
  store double %25, double* %16, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.ph, 1
  br label %._crit_edge44.preheader.prol.loopexit.unr-lcssa

._crit_edge44.preheader.prol.loopexit.unr-lcssa:  ; preds = %._crit_edge44.preheader.preheader94, %._crit_edge44.preheader.prol
  %indvars.iv.unr.ph = phi i64 [ %indvars.iv.next.prol, %._crit_edge44.preheader.prol ], [ %indvars.iv.ph, %._crit_edge44.preheader.preheader94 ]
  br label %._crit_edge44.preheader.prol.loopexit

._crit_edge44.preheader.prol.loopexit:            ; preds = %._crit_edge44.preheader.prol.loopexit.unr-lcssa
  %26 = icmp eq i64 %11, %indvars.iv.ph
  br i1 %26, label %._crit_edge._crit_edge.loopexit95, label %._crit_edge44.preheader.preheader94.new

._crit_edge44.preheader.preheader94.new:          ; preds = %._crit_edge44.preheader.prol.loopexit
  br label %._crit_edge44.preheader

min.iters.checked:                                ; preds = %._crit_edge44.preheader.preheader
  br i1 %cmp.zero, label %._crit_edge44.preheader.preheader94, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep78
  %bound1 = icmp ult double* %scevgep76, %scevgep74
  %found.conflict = and i1 %bound0, %bound1
  %bound081 = icmp ult double* %scevgep, %14
  %bound182 = icmp ult double* %14, %scevgep74
  %found.conflict83 = and i1 %bound081, %bound182
  %conflict.rdx = or i1 %found.conflict, %found.conflict83
  br i1 %conflict.rdx, label %._crit_edge44.preheader.preheader94, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %27 = load double, double* %14, align 8, !alias.scope !8
  %28 = insertelement <2 x double> undef, double %27, i32 0
  %29 = shufflevector <2 x double> %28, <2 x double> undef, <2 x i32> zeroinitializer
  %30 = insertelement <2 x double> undef, double %27, i32 0
  %31 = shufflevector <2 x double> %30, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv67, i64 %index
  %33 = bitcast double* %32 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %33, align 8, !alias.scope !11, !noalias !13
  %34 = getelementptr double, double* %32, i64 2
  %35 = bitcast double* %34 to <2 x double>*
  %wide.load85 = load <2 x double>, <2 x double>* %35, align 8, !alias.scope !11, !noalias !13
  %36 = fmul <2 x double> %wide.load, %broadcast.splat87
  %37 = fmul <2 x double> %wide.load85, %broadcast.splat87
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv67, i64 %index
  %39 = bitcast double* %38 to <2 x double>*
  %wide.load88 = load <2 x double>, <2 x double>* %39, align 8, !alias.scope !15
  %40 = getelementptr double, double* %38, i64 2
  %41 = bitcast double* %40 to <2 x double>*
  %wide.load89 = load <2 x double>, <2 x double>* %41, align 8, !alias.scope !15
  %42 = fmul <2 x double> %wide.load88, %broadcast.splat91
  %43 = fmul <2 x double> %wide.load89, %broadcast.splat91
  %44 = fmul <2 x double> %42, %29
  %45 = fmul <2 x double> %43, %31
  %46 = fadd <2 x double> %36, %44
  %47 = fadd <2 x double> %37, %45
  %48 = fadd <2 x double> %broadcast.splat93, %46
  %49 = fadd <2 x double> %broadcast.splat93, %47
  %50 = bitcast double* %32 to <2 x double>*
  store <2 x double> %48, <2 x double>* %50, align 8, !alias.scope !11, !noalias !13
  %51 = bitcast double* %34 to <2 x double>*
  store <2 x double> %49, <2 x double>* %51, align 8, !alias.scope !11, !noalias !13
  %index.next = add i64 %index, 4
  %52 = icmp eq i64 %index.next, %n.vec
  br i1 %52, label %middle.block, label %vector.body, !llvm.loop !16

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge._crit_edge, label %._crit_edge44.preheader.preheader94

._crit_edge44.preheader.us:                       ; preds = %._crit_edge44.preheader.us.preheader, %._crit_edge44._crit_edge.us
  %indvars.iv63 = phi i64 [ %indvars.iv.next64, %._crit_edge44._crit_edge.us ], [ 0, %._crit_edge44.preheader.us.preheader ]
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv67, i64 %indvars.iv63
  br label %._crit_edge44.us

._crit_edge44.us:                                 ; preds = %._crit_edge44.us, %._crit_edge44.preheader.us
  %indvars.iv57 = phi i64 [ 0, %._crit_edge44.preheader.us ], [ %indvars.iv.next58, %._crit_edge44.us ]
  %.048.us = phi double [ 0.000000e+00, %._crit_edge44.preheader.us ], [ %66, %._crit_edge44.us ]
  %54 = load double, double* %53, align 8
  %55 = fmul double %54, %2
  %56 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv67, i64 %indvars.iv57
  %57 = load double, double* %56, align 8
  %58 = fmul double %55, %57
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv57, i64 %indvars.iv63
  %60 = load double, double* %59, align 8
  %61 = fadd double %60, %58
  store double %61, double* %59, align 8
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv57, i64 %indvars.iv63
  %63 = load double, double* %62, align 8
  %64 = load double, double* %56, align 8
  %65 = fmul double %63, %64
  %66 = fadd double %.048.us, %65
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond62 = icmp eq i64 %indvars.iv.next58, %indvars.iv67
  br i1 %exitcond62, label %._crit_edge44._crit_edge.us, label %._crit_edge44.us

._crit_edge44._crit_edge.us:                      ; preds = %._crit_edge44.us
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv67, i64 %indvars.iv63
  %68 = load double, double* %67, align 8
  %69 = fmul double %68, %3
  %70 = load double, double* %53, align 8
  %71 = fmul double %70, %2
  %72 = load double, double* %14, align 8
  %73 = fmul double %71, %72
  %74 = fadd double %69, %73
  %75 = fmul double %66, %2
  %76 = fadd double %75, %74
  store double %76, double* %67, align 8
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %exitcond66 = icmp eq i64 %indvars.iv.next64, %wide.trip.count65
  br i1 %exitcond66, label %._crit_edge._crit_edge.loopexit, label %._crit_edge44.preheader.us

._crit_edge44.preheader:                          ; preds = %._crit_edge44.preheader, %._crit_edge44.preheader.preheader94.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %._crit_edge44.preheader.preheader94.new ], [ %indvars.iv.next.1, %._crit_edge44.preheader ]
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv67, i64 %indvars.iv
  %78 = load double, double* %77, align 8
  %79 = fmul double %78, %3
  %80 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv67, i64 %indvars.iv
  %81 = load double, double* %80, align 8
  %82 = fmul double %81, %2
  %83 = load double, double* %14, align 8
  %84 = fmul double %82, %83
  %85 = fadd double %79, %84
  %86 = fadd double %10, %85
  store double %86, double* %77, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %87 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv67, i64 %indvars.iv.next
  %88 = load double, double* %87, align 8
  %89 = fmul double %88, %3
  %90 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv67, i64 %indvars.iv.next
  %91 = load double, double* %90, align 8
  %92 = fmul double %91, %2
  %93 = load double, double* %14, align 8
  %94 = fmul double %92, %93
  %95 = fadd double %89, %94
  %96 = fadd double %10, %95
  store double %96, double* %87, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count65
  br i1 %exitcond.1, label %._crit_edge._crit_edge.loopexit95.unr-lcssa, label %._crit_edge44.preheader, !llvm.loop !17

._crit_edge._crit_edge.loopexit:                  ; preds = %._crit_edge44._crit_edge.us
  br label %._crit_edge._crit_edge

._crit_edge._crit_edge.loopexit95.unr-lcssa:      ; preds = %._crit_edge44.preheader
  br label %._crit_edge._crit_edge.loopexit95

._crit_edge._crit_edge.loopexit95:                ; preds = %._crit_edge44.preheader.prol.loopexit, %._crit_edge._crit_edge.loopexit95.unr-lcssa
  br label %._crit_edge._crit_edge

._crit_edge._crit_edge:                           ; preds = %._crit_edge._crit_edge.loopexit95, %._crit_edge._crit_edge.loopexit, %middle.block, %._crit_edge.preheader
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %exitcond70 = icmp eq i64 %indvars.iv.next68, %wide.trip.count69
  br i1 %exitcond70, label %._crit_edge55.loopexit, label %._crit_edge.preheader

._crit_edge55.loopexit:                           ; preds = %._crit_edge._crit_edge
  br label %._crit_edge55

._crit_edge55:                                    ; preds = %._crit_edge55.loopexit, %7
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, i32, [1200 x double]*) #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %8 = icmp sgt i32 %0, 0
  %9 = icmp sgt i32 %1, 0
  %or.cond = and i1 %8, %9
  br i1 %or.cond, label %._crit_edge.preheader.us.preheader, label %._crit_edge

._crit_edge.preheader.us.preheader:               ; preds = %3
  %10 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %1 to i64
  %wide.trip.count17 = zext i32 %0 to i64
  br label %._crit_edge.preheader.us

._crit_edge.preheader.us:                         ; preds = %._crit_edge._crit_edge.us, %._crit_edge.preheader.us.preheader
  %indvars.iv15 = phi i64 [ 0, %._crit_edge.preheader.us.preheader ], [ %indvars.iv.next16, %._crit_edge._crit_edge.us ]
  %11 = mul nsw i64 %indvars.iv15, %10
  br label %12

; <label>:12:                                     ; preds = %._crit_edge11.us, %._crit_edge.preheader.us
  %indvars.iv = phi i64 [ 0, %._crit_edge.preheader.us ], [ %indvars.iv.next, %._crit_edge11.us ]
  %13 = add nsw i64 %indvars.iv, %11
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 20
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %._crit_edge11.us

; <label>:17:                                     ; preds = %12
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %18) #5
  br label %._crit_edge11.us

._crit_edge11.us:                                 ; preds = %17, %12
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv15, i64 %indvars.iv
  %21 = load double, double* %20, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %21) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge._crit_edge.us, label %12

._crit_edge._crit_edge.us:                        ; preds = %._crit_edge11.us
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next16, %wide.trip.count17
  br i1 %exitcond18, label %._crit_edge.loopexit, label %._crit_edge.preheader.us

._crit_edge.loopexit:                             ; preds = %._crit_edge._crit_edge.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %3
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %25) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #3

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
!13 = !{!14, !9}
!14 = distinct !{!14, !10}
!15 = !{!14}
!16 = distinct !{!16, !4, !5}
!17 = distinct !{!17, !4, !5}
