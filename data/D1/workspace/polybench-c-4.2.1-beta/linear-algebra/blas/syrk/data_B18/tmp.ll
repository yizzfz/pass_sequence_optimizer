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
  call fastcc void @init_array(double* nonnull %3, double* nonnull %4, [1200 x double]* %7, [1000 x double]* %8)
  call void (...) @polybench_timer_start() #4
  %9 = load double, double* %3, align 8
  %10 = load double, double* %4, align 8
  %11 = bitcast i8* %5 to [1200 x double]*
  %12 = bitcast i8* %6 to [1000 x double]*
  call fastcc void @kernel_syrk(double %9, double %10, [1200 x double]* %11, [1000 x double]* %12)
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
  call fastcc void @print_array([1200 x double]* %18)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture, double* nocapture, [1200 x double]* nocapture, [1000 x double]* nocapture) unnamed_addr #2 {
.preheader28.lr.ph:
  store double 1.500000e+00, double* %0, align 8
  store double 1.200000e+00, double* %1, align 8
  br label %.preheader28.us

.preheader28.us:                                  ; preds = %._crit_edge35.us, %.preheader28.lr.ph
  %indvars.iv47 = phi i64 [ %indvars.iv.next48, %._crit_edge35.us ], [ 0, %.preheader28.lr.ph ]
  br label %4

; <label>:4:                                      ; preds = %4, %.preheader28.us
  %indvars.iv43 = phi i64 [ 0, %.preheader28.us ], [ %indvars.iv.next44, %4 ]
  %5 = mul nuw nsw i64 %indvars.iv43, %indvars.iv47
  %6 = add nuw nsw i64 %5, 1
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 1200
  %9 = sitofp i32 %8 to double
  %10 = fdiv double %9, 1.200000e+03
  %11 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv47, i64 %indvars.iv43
  store double %10, double* %11, align 8
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond54 = icmp eq i64 %indvars.iv.next44, 1000
  br i1 %exitcond54, label %._crit_edge35.us, label %4

._crit_edge35.us:                                 ; preds = %4
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %exitcond55 = icmp eq i64 %indvars.iv.next48, 1200
  br i1 %exitcond55, label %.preheader.us.preheader, label %.preheader28.us

.preheader.us.preheader:                          ; preds = %._crit_edge35.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv39 = phi i64 [ %indvars.iv.next40, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br label %12

; <label>:12:                                     ; preds = %12, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %12 ]
  %13 = mul nuw nsw i64 %indvars.iv, %indvars.iv39
  %14 = add nuw nsw i64 %13, 2
  %15 = trunc i64 %14 to i32
  %16 = srem i32 %15, 1000
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, 1.000000e+03
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv39, i64 %indvars.iv
  store double %18, double* %19, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond53 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond53, label %._crit_edge.us, label %12

._crit_edge.us:                                   ; preds = %12
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond = icmp eq i64 %indvars.iv.next40, 1200
  br i1 %exitcond, label %._crit_edge32, label %.preheader.us

._crit_edge32:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syrk(double, double, [1200 x double]* nocapture, [1000 x double]* nocapture readonly) unnamed_addr #2 {
.preheader28.lr.ph:
  %broadcast.splatinsert4 = insertelement <2 x double> undef, double %1, i32 0
  %broadcast.splat5 = shufflevector <2 x double> %broadcast.splatinsert4, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph.us

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new.preheader, %.lr.ph.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.us.new ], [ %indvars.iv.ph, %.lr.ph.us.new.preheader ]
  %4 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv65, i64 %indvars.iv
  %5 = load double, double* %4, align 8
  %6 = fmul double %5, %1
  store double %6, double* %4, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %7 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv65, i64 %indvars.iv.next
  %8 = load double, double* %7, align 8
  %9 = fmul double %8, %1
  store double %9, double* %7, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv65, i64 %indvars.iv.next.1
  %11 = load double, double* %10, align 8
  %12 = fmul double %11, %1
  store double %12, double* %10, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv65, i64 %indvars.iv.next.2
  %14 = load double, double* %13, align 8
  %15 = fmul double %14, %1
  store double %15, double* %13, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv63
  br i1 %exitcond.3, label %.preheader.us39.preheader.loopexit, label %.lr.ph.us.new, !llvm.loop !1

.preheader.us39.new:                              ; preds = %.preheader.us39.new.preheader, %.preheader.us39.new
  %indvars.iv49 = phi i64 [ %indvars.iv.next50.1, %.preheader.us39.new ], [ %indvars.iv49.unr.ph, %.preheader.us39.new.preheader ]
  %16 = load double, double* %32, align 8
  %17 = fmul double %16, %0
  %18 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv49, i64 %indvars.iv59
  %19 = load double, double* %18, align 8
  %20 = fmul double %17, %19
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv65, i64 %indvars.iv49
  %22 = load double, double* %21, align 8
  %23 = fadd double %22, %20
  store double %23, double* %21, align 8
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %24 = load double, double* %32, align 8
  %25 = fmul double %24, %0
  %26 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next50, i64 %indvars.iv59
  %27 = load double, double* %26, align 8
  %28 = fmul double %25, %27
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv65, i64 %indvars.iv.next50
  %30 = load double, double* %29, align 8
  %31 = fadd double %30, %28
  store double %31, double* %29, align 8
  %indvars.iv.next50.1 = add nuw nsw i64 %indvars.iv49, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next50.1, %indvars.iv63
  br i1 %exitcond.1, label %._crit_edge.us42.loopexit, label %.preheader.us39.new

.preheader.us39:                                  ; preds = %._crit_edge.us42, %.preheader.us39.preheader
  %indvars.iv59 = phi i64 [ %indvars.iv.next60, %._crit_edge.us42 ], [ 0, %.preheader.us39.preheader ]
  %32 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv65, i64 %indvars.iv59
  br i1 %lcmp.mod57, label %.prol.loopexit55, label %.prol.preheader54

.prol.preheader54:                                ; preds = %.preheader.us39
  %33 = load double, double* %32, align 8
  %34 = fmul double %33, %0
  %35 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 0, i64 %indvars.iv59
  %36 = load double, double* %35, align 8
  %37 = fmul double %34, %36
  %38 = load double, double* %73, align 8
  %39 = fadd double %38, %37
  store double %39, double* %73, align 8
  br label %.prol.loopexit55

.prol.loopexit55:                                 ; preds = %.preheader.us39, %.prol.preheader54
  %indvars.iv49.unr.ph = phi i64 [ 1, %.prol.preheader54 ], [ 0, %.preheader.us39 ]
  br i1 %72, label %._crit_edge.us42, label %.preheader.us39.new.preheader

.preheader.us39.new.preheader:                    ; preds = %.prol.loopexit55
  br label %.preheader.us39.new

.lr.ph.us:                                        ; preds = %._crit_edge33.us..lr.ph.us_crit_edge, %.preheader28.lr.ph
  %indvars.iv87 = phi i2 [ 1, %.preheader28.lr.ph ], [ %indvars.iv.next88, %._crit_edge33.us..lr.ph.us_crit_edge ]
  %indvars.iv65 = phi i64 [ 0, %.preheader28.lr.ph ], [ %indvars.iv.next66, %._crit_edge33.us..lr.ph.us_crit_edge ]
  %indvars.iv63 = phi i64 [ 1, %.preheader28.lr.ph ], [ %indvars.iv.next64, %._crit_edge33.us..lr.ph.us_crit_edge ]
  %40 = add i64 %indvars.iv65, -3
  %41 = zext i2 %indvars.iv87 to i64
  %42 = add nuw nsw i64 %41, 4294967295
  %43 = and i64 %42, 4294967295
  %44 = add nuw nsw i64 %43, 1
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %45 = trunc i64 %indvars.iv.next66 to i32
  %xtraiter = and i32 %45, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv65, i64 %indvars.iv.prol
  %47 = load double, double* %46, align 8
  %48 = fmul double %47, %1
  store double %48, double* %46, align 8
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !5

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph.us
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph.us ], [ %44, %.prol.loopexit.loopexit ]
  %49 = icmp ult i64 %indvars.iv65, 3
  br i1 %49, label %.preheader.us39.preheader, label %.prol.loopexit..lr.ph.us.new_crit_edge

.prol.loopexit..lr.ph.us.new_crit_edge:           ; preds = %.prol.loopexit
  %50 = sub i64 %40, %indvars.iv.unr
  %51 = lshr i64 %50, 2
  %52 = add nuw nsw i64 %51, 1
  %min.iters.check = icmp ult i64 %52, 2
  br i1 %min.iters.check, label %.lr.ph.us.new.preheader, label %min.iters.checked

.lr.ph.us.new.preheader:                          ; preds = %middle.block, %min.iters.checked, %.prol.loopexit..lr.ph.us.new_crit_edge
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked ], [ %indvars.iv.unr, %.prol.loopexit..lr.ph.us.new_crit_edge ], [ %ind.end, %middle.block ]
  br label %.lr.ph.us.new

min.iters.checked:                                ; preds = %.prol.loopexit..lr.ph.us.new_crit_edge
  %n.mod.vf = and i64 %52, 1
  %n.vec = sub nsw i64 %52, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %53 = add nsw i64 %indvars.iv.unr, 4
  %54 = shl nuw i64 %51, 2
  %55 = add i64 %53, %54
  %56 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %55, %56
  br i1 %cmp.zero, label %.lr.ph.us.new.preheader, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %57 = shl i64 %index, 2
  %58 = add i64 %indvars.iv.unr, %57
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv65, i64 %58
  %60 = bitcast double* %59 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %60, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec1 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec2 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec3 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %61 = fmul <2 x double> %strided.vec, %broadcast.splat5
  %62 = fmul <2 x double> %strided.vec1, %broadcast.splat5
  %63 = fmul <2 x double> %strided.vec2, %broadcast.splat5
  %64 = add nsw i64 %58, 3
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv65, i64 %64
  %66 = fmul <2 x double> %strided.vec3, %broadcast.splat5
  %67 = getelementptr double, double* %65, i64 -3
  %68 = bitcast double* %67 to <8 x double>*
  %69 = shufflevector <2 x double> %61, <2 x double> %62, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %70 = shufflevector <2 x double> %63, <2 x double> %66, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %69, <4 x double> %70, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %68, align 8
  %index.next = add i64 %index, 2
  %71 = icmp eq i64 %index.next, %n.vec
  br i1 %71, label %middle.block, label %vector.body, !llvm.loop !7

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %.preheader.us39.preheader, label %.lr.ph.us.new.preheader

.preheader.us39.preheader.loopexit:               ; preds = %.lr.ph.us.new
  br label %.preheader.us39.preheader

.preheader.us39.preheader:                        ; preds = %.preheader.us39.preheader.loopexit, %.prol.loopexit, %middle.block
  %xtraiter5685 = and i64 %indvars.iv.next66, 1
  %lcmp.mod57 = icmp eq i64 %xtraiter5685, 0
  %72 = icmp eq i64 %indvars.iv65, 0
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv65, i64 0
  br label %.preheader.us39

._crit_edge.us42.loopexit:                        ; preds = %.preheader.us39.new
  br label %._crit_edge.us42

._crit_edge.us42:                                 ; preds = %._crit_edge.us42.loopexit, %.prol.loopexit55
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %exitcond89 = icmp eq i64 %indvars.iv.next60, 1000
  br i1 %exitcond89, label %._crit_edge33.us, label %.preheader.us39

._crit_edge33.us:                                 ; preds = %._crit_edge.us42
  %exitcond = icmp eq i64 %indvars.iv.next66, 1200
  br i1 %exitcond, label %._crit_edge37, label %._crit_edge33.us..lr.ph.us_crit_edge

._crit_edge33.us..lr.ph.us_crit_edge:             ; preds = %._crit_edge33.us
  %indvars.iv.next88 = add i2 %indvars.iv87, 1
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  br label %.lr.ph.us

._crit_edge37:                                    ; preds = %._crit_edge33.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly) unnamed_addr #0 {
.preheader.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv14 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next15, %._crit_edge.us ]
  %5 = mul nsw i64 %indvars.iv14, 1200
  br label %6

; <label>:6:                                      ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %7 = add nsw i64 %indvars.iv, %5
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv14, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond18, label %._crit_edge.us, label %6

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond = icmp eq i64 %indvars.iv.next15, 1200
  br i1 %exitcond, label %._crit_edge13, label %.preheader.us

._crit_edge13:                                    ; preds = %._crit_edge.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #5
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
