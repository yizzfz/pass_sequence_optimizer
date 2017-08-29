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
.preheader30.lr.ph:
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  br label %.preheader30.us

.preheader30.us:                                  ; preds = %._crit_edge37.us, %.preheader30.lr.ph
  %indvars.iv49 = phi i64 [ %indvars.iv.next50, %._crit_edge37.us ], [ 0, %.preheader30.lr.ph ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader30.us
  %indvars.iv45 = phi i64 [ 0, %.preheader30.us ], [ %indvars.iv.next46, %._crit_edge ]
  %6 = mul nuw nsw i64 %indvars.iv45, %indvars.iv49
  %7 = add nuw nsw i64 %6, 1
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 1200
  %10 = sitofp i32 %9 to double
  %11 = fdiv double %10, 1.200000e+03
  %12 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv49, i64 %indvars.iv45
  store double %11, double* %12, align 8
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond57 = icmp eq i64 %indvars.iv.next46, 1000
  br i1 %exitcond57, label %._crit_edge37.us, label %._crit_edge

._crit_edge37.us:                                 ; preds = %._crit_edge
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %exitcond58 = icmp eq i64 %indvars.iv.next50, 1200
  br i1 %exitcond58, label %.preheader.us.preheader, label %.preheader30.us

.preheader.us.preheader:                          ; preds = %._crit_edge37.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv41 = phi i64 [ %indvars.iv.next42, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br label %._crit_edge54

._crit_edge54:                                    ; preds = %._crit_edge54, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge54 ]
  %13 = mul nuw nsw i64 %indvars.iv, %indvars.iv41
  %14 = add nuw nsw i64 %13, 2
  %15 = trunc i64 %14 to i32
  %16 = srem i32 %15, 1000
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, 1.000000e+03
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv41, i64 %indvars.iv
  store double %18, double* %19, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond56 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond56, label %._crit_edge.us, label %._crit_edge54

._crit_edge.us:                                   ; preds = %._crit_edge54
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %exitcond = icmp eq i64 %indvars.iv.next42, 1200
  br i1 %exitcond, label %._crit_edge34, label %.preheader.us

._crit_edge34:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syrk(i32, i32, double, double, [1200 x double]* nocapture, [1000 x double]* nocapture readonly) unnamed_addr #2 {
.preheader28.lr.ph:
  %broadcast.splatinsert99 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat100 = shufflevector <2 x double> %broadcast.splatinsert99, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph.us

._crit_edge:                                      ; preds = %._crit_edge.preheader, %._crit_edge
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %._crit_edge ], [ %indvars.iv.ph, %._crit_edge.preheader ]
  %6 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv65, i64 %indvars.iv
  %7 = load double, double* %6, align 8
  %8 = fmul double %7, %3
  store double %8, double* %6, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %9 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv65, i64 %indvars.iv.next
  %10 = load double, double* %9, align 8
  %11 = fmul double %10, %3
  store double %11, double* %9, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv65, i64 %indvars.iv.next.1
  %13 = load double, double* %12, align 8
  %14 = fmul double %13, %3
  store double %14, double* %12, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv65, i64 %indvars.iv.next.2
  %16 = load double, double* %15, align 8
  %17 = fmul double %16, %3
  store double %17, double* %15, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv63
  br i1 %exitcond.3, label %.preheader.us38.preheader.loopexit, label %._crit_edge, !llvm.loop !1

.preheader.us38.preheader.loopexit:               ; preds = %._crit_edge
  br label %.preheader.us38.preheader

.preheader.us38.preheader:                        ; preds = %.preheader.us38.preheader.loopexit, %.prol.loopexit, %middle.block
  %xtraiter5689 = and i64 %indvars.iv.next66, 1
  %lcmp.mod57 = icmp eq i64 %xtraiter5689, 0
  %18 = icmp eq i64 %indvars.iv65, 0
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv65, i64 0
  br label %.preheader.us38

.preheader.us38:                                  ; preds = %._crit_edge.us42, %.preheader.us38.preheader
  %indvars.iv59 = phi i64 [ %indvars.iv.next60, %._crit_edge.us42 ], [ 0, %.preheader.us38.preheader ]
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv65, i64 %indvars.iv59
  br i1 %lcmp.mod57, label %.prol.loopexit55, label %.prol.preheader54

.prol.preheader54:                                ; preds = %.preheader.us38
  %21 = load double, double* %20, align 8
  %22 = fmul double %21, %2
  %23 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 0, i64 %indvars.iv59
  %24 = load double, double* %23, align 8
  %25 = fmul double %22, %24
  %26 = load double, double* %19, align 8
  %27 = fadd double %26, %25
  store double %27, double* %19, align 8
  br label %.prol.loopexit55

.prol.loopexit55:                                 ; preds = %.preheader.us38, %.prol.preheader54
  %indvars.iv49.unr.ph = phi i64 [ 1, %.prol.preheader54 ], [ 0, %.preheader.us38 ]
  br i1 %18, label %._crit_edge.us42, label %.preheader.us38.new.preheader

.preheader.us38.new.preheader:                    ; preds = %.prol.loopexit55
  br label %.preheader.us38.new

.preheader.us38.new:                              ; preds = %.preheader.us38.new.preheader, %.preheader.us38.new
  %indvars.iv49 = phi i64 [ %indvars.iv.next50.1, %.preheader.us38.new ], [ %indvars.iv49.unr.ph, %.preheader.us38.new.preheader ]
  %28 = load double, double* %20, align 8
  %29 = fmul double %28, %2
  %30 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv49, i64 %indvars.iv59
  %31 = load double, double* %30, align 8
  %32 = fmul double %29, %31
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv65, i64 %indvars.iv49
  %34 = load double, double* %33, align 8
  %35 = fadd double %34, %32
  store double %35, double* %33, align 8
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %36 = load double, double* %20, align 8
  %37 = fmul double %36, %2
  %38 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv.next50, i64 %indvars.iv59
  %39 = load double, double* %38, align 8
  %40 = fmul double %37, %39
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv65, i64 %indvars.iv.next50
  %42 = load double, double* %41, align 8
  %43 = fadd double %42, %40
  store double %43, double* %41, align 8
  %indvars.iv.next50.1 = add nuw nsw i64 %indvars.iv49, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next50.1, %indvars.iv63
  br i1 %exitcond.1, label %._crit_edge.us42.loopexit, label %.preheader.us38.new

.lr.ph.us:                                        ; preds = %.preheader28.lr.ph, %._crit_edge33.us..preheader28.us_crit_edge
  %indvars.iv91 = phi i2 [ 1, %.preheader28.lr.ph ], [ %indvars.iv.next92, %._crit_edge33.us..preheader28.us_crit_edge ]
  %indvars.iv65 = phi i64 [ 0, %.preheader28.lr.ph ], [ %indvars.iv.next66, %._crit_edge33.us..preheader28.us_crit_edge ]
  %indvars.iv63 = phi i64 [ 1, %.preheader28.lr.ph ], [ %indvars.iv.next64, %._crit_edge33.us..preheader28.us_crit_edge ]
  %44 = add i64 %indvars.iv65, -3
  %45 = zext i2 %indvars.iv91 to i64
  %46 = add nuw nsw i64 %45, 4294967295
  %47 = and i64 %46, 4294967295
  %48 = add nuw nsw i64 %47, 1
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %49 = trunc i64 %indvars.iv.next66 to i32
  %xtraiter = and i32 %49, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv65, i64 %indvars.iv.prol
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
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph.us ], [ %48, %.prol.loopexit.loopexit ]
  %53 = icmp ult i64 %indvars.iv65, 3
  br i1 %53, label %.preheader.us38.preheader, label %.prol.loopexit.._crit_edge_crit_edge

.prol.loopexit.._crit_edge_crit_edge:             ; preds = %.prol.loopexit
  %54 = sub i64 %44, %indvars.iv.unr
  %55 = lshr i64 %54, 2
  %56 = add nuw nsw i64 %55, 1
  %min.iters.check = icmp ult i64 %56, 2
  br i1 %min.iters.check, label %._crit_edge.preheader, label %min.iters.checked

._crit_edge.preheader:                            ; preds = %middle.block, %min.iters.checked, %.prol.loopexit.._crit_edge_crit_edge
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked ], [ %indvars.iv.unr, %.prol.loopexit.._crit_edge_crit_edge ], [ %ind.end, %middle.block ]
  br label %._crit_edge

min.iters.checked:                                ; preds = %.prol.loopexit.._crit_edge_crit_edge
  %n.mod.vf = and i64 %56, 1
  %n.vec = sub nsw i64 %56, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %57 = add nsw i64 %indvars.iv.unr, 4
  %58 = shl nuw i64 %55, 2
  %59 = add i64 %57, %58
  %60 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %59, %60
  br i1 %cmp.zero, label %._crit_edge.preheader, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %61 = shl i64 %index, 2
  %62 = add i64 %indvars.iv.unr, %61
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv65, i64 %62
  %64 = bitcast double* %63 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %64, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec96 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec97 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec98 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %65 = fmul <2 x double> %strided.vec, %broadcast.splat100
  %66 = fmul <2 x double> %strided.vec96, %broadcast.splat100
  %67 = fmul <2 x double> %strided.vec97, %broadcast.splat100
  %68 = add nsw i64 %62, 3
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv65, i64 %68
  %70 = fmul <2 x double> %strided.vec98, %broadcast.splat100
  %71 = getelementptr double, double* %69, i64 -3
  %72 = bitcast double* %71 to <8 x double>*
  %73 = shufflevector <2 x double> %65, <2 x double> %66, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %74 = shufflevector <2 x double> %67, <2 x double> %70, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %73, <4 x double> %74, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %72, align 8
  %index.next = add i64 %index, 2
  %75 = icmp eq i64 %index.next, %n.vec
  br i1 %75, label %middle.block, label %vector.body, !llvm.loop !7

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %.preheader.us38.preheader, label %._crit_edge.preheader

._crit_edge.us42.loopexit:                        ; preds = %.preheader.us38.new
  br label %._crit_edge.us42

._crit_edge.us42:                                 ; preds = %._crit_edge.us42.loopexit, %.prol.loopexit55
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %exitcond93 = icmp eq i64 %indvars.iv.next60, 1000
  br i1 %exitcond93, label %._crit_edge33.us, label %.preheader.us38

._crit_edge33.us:                                 ; preds = %._crit_edge.us42
  %exitcond68 = icmp eq i64 %indvars.iv.next66, 1200
  br i1 %exitcond68, label %._crit_edge37, label %._crit_edge33.us..preheader28.us_crit_edge

._crit_edge33.us..preheader28.us_crit_edge:       ; preds = %._crit_edge33.us
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %indvars.iv.next92 = add i2 %indvars.iv91, 1
  br label %.lr.ph.us

._crit_edge37:                                    ; preds = %._crit_edge33.us
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
  %indvars.iv15 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next16, %._crit_edge.us ]
  %6 = mul nsw i64 %indvars.iv15, 1200
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %7 = add nsw i64 %indvars.iv, %6
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %._crit_edge19
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge19, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv15, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond20 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond20, label %._crit_edge.us, label %._crit_edge19

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond = icmp eq i64 %indvars.iv.next16, 1200
  br i1 %exitcond, label %._crit_edge14, label %.preheader.us

._crit_edge14:                                    ; preds = %._crit_edge.us
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
