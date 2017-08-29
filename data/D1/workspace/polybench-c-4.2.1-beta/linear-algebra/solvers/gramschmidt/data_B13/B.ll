; ModuleID = 'A.ll'
source_filename = "gramschmidt.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"R\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"Q\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = bitcast i8* %3 to [1200 x double]*
  %7 = bitcast i8* %4 to [1200 x double]*
  %8 = bitcast i8* %5 to [1200 x double]*
  tail call fastcc void @init_array(i32 1000, i32 1200, [1200 x double]* %6, [1200 x double]* %7, [1200 x double]* %8)
  tail call void (...) @polybench_timer_start() #4
  %9 = bitcast i8* %5 to [1200 x double]*
  tail call fastcc void @kernel_gramschmidt(i32 1000, i32 1200, [1200 x double]* %6, [1200 x double]* %7, [1200 x double]* %9)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %10 = icmp sgt i32 %0, 42
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %2
  %12 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %12, align 1
  %13 = icmp eq i8 %strcmpload, 0
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %11
  %15 = bitcast i8* %5 to [1200 x double]*
  %16 = bitcast i8* %4 to [1200 x double]*
  tail call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %16, [1200 x double]* %15)
  br label %._crit_edge

._crit_edge:                                      ; preds = %11, %2, %14
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, [1200 x double]*, [1200 x double]*, [1200 x double]*) unnamed_addr #2 {
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %._crit_edge.lr.ph, label %._crit_edge4

._crit_edge.lr.ph:                                ; preds = %5
  %wide.trip.count32 = zext i32 %1 to i64
  %7 = icmp sgt i32 %1, 0
  %8 = sext i32 %0 to i64
  %9 = sitofp i32 %0 to double
  br i1 %7, label %._crit_edge.us.preheader, label %._crit_edge4

._crit_edge.us.preheader:                         ; preds = %._crit_edge.lr.ph
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.preheader, %._crit_edge16.us
  %indvars.iv38 = phi i64 [ %indvars.iv.next39, %._crit_edge16.us ], [ 0, %._crit_edge.us.preheader ]
  br label %10

; <label>:10:                                     ; preds = %10, %._crit_edge.us
  %indvars.iv30 = phi i64 [ 0, %._crit_edge.us ], [ %indvars.iv.next31, %10 ]
  %11 = mul nsw i64 %indvars.iv38, %indvars.iv30
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, %0
  %14 = sitofp i32 %13 to double
  %15 = fdiv double %14, %9
  %16 = fmul double %15, 1.000000e+02
  %17 = fadd double %16, 1.000000e+01
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv38, i64 %indvars.iv30
  store double %17, double* %18, align 8
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %indvars.iv30
  store double 0.000000e+00, double* %19, align 8
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %exitcond33 = icmp eq i64 %indvars.iv.next31, %wide.trip.count32
  br i1 %exitcond33, label %._crit_edge16.us, label %10

._crit_edge16.us:                                 ; preds = %10
  %indvars.iv.next39 = add nsw i64 %indvars.iv38, 1
  %20 = icmp slt i64 %indvars.iv.next39, %8
  br i1 %20, label %._crit_edge.us, label %._crit_edge4.loopexit

._crit_edge4.loopexit:                            ; preds = %._crit_edge16.us
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit, %._crit_edge.lr.ph, %5
  %21 = icmp sgt i32 %1, 0
  br i1 %21, label %._crit_edge5.us.preheader, label %.loopexit

._crit_edge5.us.preheader:                        ; preds = %._crit_edge4
  %22 = sext i32 %1 to i64
  %23 = add i32 %1, -1
  %24 = zext i32 %23 to i64
  %25 = shl nuw nsw i64 %24, 3
  %26 = add nuw nsw i64 %25, 8
  %27 = add nsw i64 %22, -1
  %xtraiter = and i64 %22, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge7.us.prol.loopexit, label %._crit_edge7.us.prol.preheader

._crit_edge7.us.prol.preheader:                   ; preds = %._crit_edge5.us.preheader
  br label %._crit_edge7.us.prol

._crit_edge7.us.prol:                             ; preds = %._crit_edge7.us.prol, %._crit_edge7.us.prol.preheader
  %indvars.iv28.prol = phi i64 [ 0, %._crit_edge7.us.prol.preheader ], [ %indvars.iv.next29.prol, %._crit_edge7.us.prol ]
  %indvar.prol = phi i64 [ 0, %._crit_edge7.us.prol.preheader ], [ %indvar.next.prol, %._crit_edge7.us.prol ]
  %prol.iter = phi i64 [ %xtraiter, %._crit_edge7.us.prol.preheader ], [ %prol.iter.sub, %._crit_edge7.us.prol ]
  %scevgep.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvar.prol, i64 0
  %scevgep27.prol = bitcast double* %scevgep.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep27.prol, i8 0, i64 %26, i32 8, i1 false)
  %indvars.iv.next29.prol = add nsw i64 %indvars.iv28.prol, 1
  %indvar.next.prol = add nuw nsw i64 %indvar.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge7.us.prol.loopexit.unr-lcssa, label %._crit_edge7.us.prol, !llvm.loop !1

._crit_edge7.us.prol.loopexit.unr-lcssa:          ; preds = %._crit_edge7.us.prol
  br label %._crit_edge7.us.prol.loopexit

._crit_edge7.us.prol.loopexit:                    ; preds = %._crit_edge5.us.preheader, %._crit_edge7.us.prol.loopexit.unr-lcssa
  %indvars.iv28.unr = phi i64 [ 0, %._crit_edge5.us.preheader ], [ %indvars.iv.next29.prol, %._crit_edge7.us.prol.loopexit.unr-lcssa ]
  %indvar.unr = phi i64 [ 0, %._crit_edge5.us.preheader ], [ %indvar.next.prol, %._crit_edge7.us.prol.loopexit.unr-lcssa ]
  %28 = icmp ult i64 %27, 3
  br i1 %28, label %.loopexit.loopexit, label %._crit_edge5.us.preheader.new

._crit_edge5.us.preheader.new:                    ; preds = %._crit_edge7.us.prol.loopexit
  br label %._crit_edge7.us

._crit_edge7.us:                                  ; preds = %._crit_edge7.us, %._crit_edge5.us.preheader.new
  %indvars.iv28 = phi i64 [ %indvars.iv28.unr, %._crit_edge5.us.preheader.new ], [ %indvars.iv.next29.3, %._crit_edge7.us ]
  %indvar = phi i64 [ %indvar.unr, %._crit_edge5.us.preheader.new ], [ %indvar.next.3, %._crit_edge7.us ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvar, i64 0
  %scevgep27 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep27, i8 0, i64 %26, i32 8, i1 false)
  %indvar.next = add nuw nsw i64 %indvar, 1
  %scevgep.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvar.next, i64 0
  %scevgep27.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep27.1, i8 0, i64 %26, i32 8, i1 false)
  %indvar.next.1 = add nsw i64 %indvar, 2
  %scevgep.2 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvar.next.1, i64 0
  %scevgep27.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep27.2, i8 0, i64 %26, i32 8, i1 false)
  %indvar.next.2 = add nsw i64 %indvar, 3
  %scevgep.3 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvar.next.2, i64 0
  %scevgep27.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep27.3, i8 0, i64 %26, i32 8, i1 false)
  %indvars.iv.next29.3 = add nsw i64 %indvars.iv28, 4
  %29 = icmp slt i64 %indvars.iv.next29.3, %22
  %indvar.next.3 = add nsw i64 %indvar, 4
  br i1 %29, label %._crit_edge7.us, label %.loopexit.loopexit.unr-lcssa

.loopexit.loopexit.unr-lcssa:                     ; preds = %._crit_edge7.us
  br label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %._crit_edge7.us.prol.loopexit, %.loopexit.loopexit.unr-lcssa
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %._crit_edge4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_gramschmidt(i32, i32, [1200 x double]*, [1200 x double]*, [1200 x double]*) unnamed_addr #0 {
  %6 = icmp sgt i32 %1, 0
  br i1 %6, label %.lr.ph50, label %.loopexit

.lr.ph50:                                         ; preds = %5
  %wide.trip.count.3 = zext i32 %0 to i64
  %7 = add i32 %1, -2
  %8 = zext i32 %7 to i64
  %9 = sext i32 %1 to i64
  %10 = add i32 %0, -1
  %11 = and i32 %0, 3
  %12 = add nsw i32 %11, -1
  %13 = zext i32 %12 to i64
  %14 = add nuw nsw i64 %13, 1
  %15 = and i32 %0, 1
  %xtraiter112 = and i64 %wide.trip.count.3, 1
  %16 = icmp sgt i32 %0, 0
  %17 = icmp eq i32 %11, 0
  %18 = icmp ult i32 %10, 3
  %19 = icmp sgt i32 %0, 0
  %20 = icmp eq i32 %15, 0
  %21 = icmp eq i32 %0, 1
  %22 = icmp sgt i32 %0, 0
  %23 = icmp eq i64 %xtraiter112, 0
  %24 = icmp eq i32 %0, 1
  %25 = icmp eq i64 %xtraiter112, 0
  %26 = icmp eq i32 %0, 1
  %sunkaddr127 = ptrtoint [1200 x double]* %4 to i64
  %sunkaddr = ptrtoint [1200 x double]* %4 to i64
  br label %27

; <label>:27:                                     ; preds = %.lr.ph50, %._crit_edge31
  %indvars.iv100 = phi i64 [ 0, %.lr.ph50 ], [ %indvars.iv.next101, %._crit_edge31 ]
  %indvars.iv92 = phi i64 [ 1, %.lr.ph50 ], [ %indvars.iv.next93, %._crit_edge31 ]
  %indvar = phi i64 [ 0, %.lr.ph50 ], [ %indvar.next, %._crit_edge31 ]
  %28 = mul nuw nsw i64 %indvar, 1201
  %29 = add nsw i64 %28, 1
  %scevgep = getelementptr [1200 x double], [1200 x double]* %3, i64 0, i64 %29
  %30 = sub nsw i64 %8, %indvar
  %31 = shl i64 %30, 3
  %32 = and i64 %31, 34359738360
  %33 = add nuw nsw i64 %32, 8
  br i1 %16, label %.lr.ph, label %._crit_edge8

.lr.ph:                                           ; preds = %27
  br i1 %17, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %34 = phi double [ %38, %.prol.preheader ], [ 0.000000e+00, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %11, %.prol.preheader.preheader ]
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.prol, i64 %indvars.iv100
  %36 = load double, double* %35, align 8
  %37 = fmul double %36, %36
  %38 = fadd double %34, %37
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !3

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph ], [ %14, %.prol.loopexit.loopexit ]
  %.unr = phi double [ 0.000000e+00, %.lr.ph ], [ %38, %.prol.loopexit.loopexit ]
  %.lcssa.unr = phi double [ undef, %.lr.ph ], [ %38, %.prol.loopexit.loopexit ]
  br i1 %18, label %._crit_edge8, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.new ], [ %indvars.iv.unr, %.lr.ph.new.preheader ]
  %39 = phi double [ %55, %.lr.ph.new ], [ %.unr, %.lr.ph.new.preheader ]
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv, i64 %indvars.iv100
  %41 = load double, double* %40, align 8
  %42 = fmul double %41, %41
  %43 = fadd double %39, %42
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next, i64 %indvars.iv100
  %45 = load double, double* %44, align 8
  %46 = fmul double %45, %45
  %47 = fadd double %43, %46
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next.1, i64 %indvars.iv100
  %49 = load double, double* %48, align 8
  %50 = fmul double %49, %49
  %51 = fadd double %47, %50
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next.2, i64 %indvars.iv100
  %53 = load double, double* %52, align 8
  %54 = fmul double %53, %53
  %55 = fadd double %51, %54
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %._crit_edge8.loopexit, label %.lr.ph.new

._crit_edge8.loopexit:                            ; preds = %.lr.ph.new
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit, %.prol.loopexit, %27
  %.lcssa55 = phi double [ 0.000000e+00, %27 ], [ %.lcssa.unr, %.prol.loopexit ], [ %55, %._crit_edge8.loopexit ]
  %56 = tail call double @sqrt(double %.lcssa55) #4
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv100, i64 %indvars.iv100
  store double %56, double* %57, align 8
  br i1 %19, label %.lr.ph13, label %._crit_edge14

.lr.ph13:                                         ; preds = %._crit_edge8
  br i1 %20, label %.prol.loopexit103, label %58

; <label>:58:                                     ; preds = %.lr.ph13
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 0, i64 %indvars.iv100
  %60 = load double, double* %59, align 8
  %61 = fdiv double %60, %56
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv100
  store double %61, double* %62, align 8
  br label %.prol.loopexit103

.prol.loopexit103:                                ; preds = %.lr.ph13, %58
  %indvars.iv62.unr.ph = phi i64 [ 1, %58 ], [ 0, %.lr.ph13 ]
  br i1 %21, label %._crit_edge14, label %.lr.ph13.new.preheader

.lr.ph13.new.preheader:                           ; preds = %.prol.loopexit103
  br label %.lr.ph13.new

.lr.ph13.new:                                     ; preds = %.lr.ph13.new.preheader, %.lr.ph13.new
  %indvars.iv62 = phi i64 [ %indvars.iv.next63.1, %.lr.ph13.new ], [ %indvars.iv62.unr.ph, %.lr.ph13.new.preheader ]
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv62, i64 %indvars.iv100
  %64 = load double, double* %63, align 8
  %65 = load double, double* %57, align 8
  %66 = fdiv double %64, %65
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv62, i64 %indvars.iv100
  store double %66, double* %67, align 8
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next63, i64 %indvars.iv100
  %69 = load double, double* %68, align 8
  %70 = load double, double* %57, align 8
  %71 = fdiv double %69, %70
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next63, i64 %indvars.iv100
  store double %71, double* %72, align 8
  %indvars.iv.next63.1 = add nuw nsw i64 %indvars.iv62, 2
  %exitcond65.1 = icmp eq i64 %indvars.iv.next63.1, %wide.trip.count.3
  br i1 %exitcond65.1, label %._crit_edge14.loopexit, label %.lr.ph13.new

._crit_edge14.loopexit:                           ; preds = %.lr.ph13.new
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit, %.prol.loopexit103, %._crit_edge8
  %indvars.iv.next101 = add nsw i64 %indvars.iv100, 1
  %73 = icmp slt i64 %indvars.iv.next101, %9
  br i1 %73, label %.lr.ph30, label %._crit_edge31

.lr.ph30:                                         ; preds = %._crit_edge14
  br i1 %22, label %.lr.ph30.split.us.preheader, label %.lr.ph30.split.split.preheader

.lr.ph30.split.us.preheader:                      ; preds = %.lr.ph30
  %sunkaddr128 = shl i64 %indvars.iv100, 3
  %sunkaddr129 = add i64 %sunkaddr127, %sunkaddr128
  %sunkaddr130 = inttoptr i64 %sunkaddr129 to double*
  %sunkaddr124 = shl i64 %indvars.iv100, 3
  %sunkaddr125 = add i64 %sunkaddr, %sunkaddr124
  %sunkaddr126 = inttoptr i64 %sunkaddr125 to double*
  br label %.lr.ph30.split.us

.lr.ph30.split.us:                                ; preds = %.lr.ph30.split.us.preheader, %._crit_edge24.us
  %indvars.iv94 = phi i64 [ %indvars.iv.next95, %._crit_edge24.us ], [ %indvars.iv92, %.lr.ph30.split.us.preheader ]
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv100, i64 %indvars.iv94
  store double 0.000000e+00, double* %74, align 8
  br i1 %23, label %.prol.loopexit111, label %75

; <label>:75:                                     ; preds = %.lr.ph30.split.us
  %76 = load double, double* %sunkaddr126, align 8
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 0, i64 %indvars.iv94
  %78 = load double, double* %77, align 8
  %79 = fmul double %76, %78
  %80 = fadd double %79, 0.000000e+00
  store double %80, double* %74, align 8
  br label %.prol.loopexit111

.prol.loopexit111:                                ; preds = %.lr.ph30.split.us, %75
  %81 = phi double [ %80, %75 ], [ 0.000000e+00, %.lr.ph30.split.us ]
  %indvars.iv84.unr.ph = phi i64 [ 1, %75 ], [ 0, %.lr.ph30.split.us ]
  br i1 %24, label %.lr.ph23.us, label %.lr.ph30.split.us.new.preheader

.lr.ph30.split.us.new.preheader:                  ; preds = %.prol.loopexit111
  br label %.lr.ph30.split.us.new

._crit_edge24.us.loopexit:                        ; preds = %.lr.ph23.us.new
  br label %._crit_edge24.us

._crit_edge24.us:                                 ; preds = %._crit_edge24.us.loopexit, %.prol.loopexit115
  %indvars.iv.next95 = add nsw i64 %indvars.iv94, 1
  %lftr.wideiv96 = trunc i64 %indvars.iv.next95 to i32
  %exitcond97 = icmp eq i32 %lftr.wideiv96, %1
  br i1 %exitcond97, label %._crit_edge31.loopexit, label %.lr.ph30.split.us

.lr.ph23.us.new:                                  ; preds = %.lr.ph23.us.new.preheader, %.lr.ph23.us.new
  %indvars.iv88 = phi i64 [ %indvars.iv.next89.1, %.lr.ph23.us.new ], [ %indvars.iv88.unr.ph, %.lr.ph23.us.new.preheader ]
  %82 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv88, i64 %indvars.iv94
  %83 = load double, double* %82, align 8
  %84 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv88, i64 %indvars.iv100
  %85 = load double, double* %84, align 8
  %86 = load double, double* %74, align 8
  %87 = fmul double %85, %86
  %88 = fsub double %83, %87
  store double %88, double* %82, align 8
  %indvars.iv.next89 = add nuw nsw i64 %indvars.iv88, 1
  %89 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next89, i64 %indvars.iv94
  %90 = load double, double* %89, align 8
  %91 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next89, i64 %indvars.iv100
  %92 = load double, double* %91, align 8
  %93 = load double, double* %74, align 8
  %94 = fmul double %92, %93
  %95 = fsub double %90, %94
  store double %95, double* %89, align 8
  %indvars.iv.next89.1 = add nuw nsw i64 %indvars.iv88, 2
  %exitcond91.1 = icmp eq i64 %indvars.iv.next89.1, %wide.trip.count.3
  br i1 %exitcond91.1, label %._crit_edge24.us.loopexit, label %.lr.ph23.us.new

.lr.ph30.split.us.new:                            ; preds = %.lr.ph30.split.us.new.preheader, %.lr.ph30.split.us.new
  %96 = phi double [ %108, %.lr.ph30.split.us.new ], [ %81, %.lr.ph30.split.us.new.preheader ]
  %indvars.iv84 = phi i64 [ %indvars.iv.next85.1, %.lr.ph30.split.us.new ], [ %indvars.iv84.unr.ph, %.lr.ph30.split.us.new.preheader ]
  %97 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv84, i64 %indvars.iv100
  %98 = load double, double* %97, align 8
  %99 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv84, i64 %indvars.iv94
  %100 = load double, double* %99, align 8
  %101 = fmul double %98, %100
  %102 = fadd double %101, %96
  store double %102, double* %74, align 8
  %indvars.iv.next85 = add nuw nsw i64 %indvars.iv84, 1
  %103 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next85, i64 %indvars.iv100
  %104 = load double, double* %103, align 8
  %105 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next85, i64 %indvars.iv94
  %106 = load double, double* %105, align 8
  %107 = fmul double %104, %106
  %108 = fadd double %107, %102
  store double %108, double* %74, align 8
  %indvars.iv.next85.1 = add nuw nsw i64 %indvars.iv84, 2
  %exitcond87.1 = icmp eq i64 %indvars.iv.next85.1, %wide.trip.count.3
  br i1 %exitcond87.1, label %.lr.ph23.us.loopexit, label %.lr.ph30.split.us.new

.lr.ph23.us.loopexit:                             ; preds = %.lr.ph30.split.us.new
  br label %.lr.ph23.us

.lr.ph23.us:                                      ; preds = %.lr.ph23.us.loopexit, %.prol.loopexit111
  %109 = phi double [ %81, %.prol.loopexit111 ], [ %108, %.lr.ph23.us.loopexit ]
  br i1 %25, label %.prol.loopexit115, label %110

; <label>:110:                                    ; preds = %.lr.ph23.us
  %111 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 0, i64 %indvars.iv94
  %112 = load double, double* %111, align 8
  %113 = load double, double* %sunkaddr130, align 8
  %114 = fmul double %113, %109
  %115 = fsub double %112, %114
  store double %115, double* %111, align 8
  br label %.prol.loopexit115

.prol.loopexit115:                                ; preds = %.lr.ph23.us, %110
  %indvars.iv88.unr.ph = phi i64 [ 1, %110 ], [ 0, %.lr.ph23.us ]
  br i1 %26, label %._crit_edge24.us, label %.lr.ph23.us.new.preheader

.lr.ph23.us.new.preheader:                        ; preds = %.prol.loopexit115
  br label %.lr.ph23.us.new

.lr.ph30.split.split.preheader:                   ; preds = %.lr.ph30
  %116 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %116, i8 0, i64 %33, i32 8, i1 false)
  br label %._crit_edge31

._crit_edge31.loopexit:                           ; preds = %._crit_edge24.us
  br label %._crit_edge31

._crit_edge31:                                    ; preds = %._crit_edge31.loopexit, %.lr.ph30.split.split.preheader, %._crit_edge14
  %117 = icmp slt i64 %indvars.iv.next101, %9
  %indvars.iv.next93 = add nsw i64 %indvars.iv92, 1
  %indvar.next = add nuw nsw i64 %indvar, 1
  br i1 %117, label %27, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %._crit_edge31
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %5
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]*, [1200 x double]*) unnamed_addr #0 {
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %5) #6
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %._crit_edge.us.preheader, label %.loopexit4

._crit_edge.us.preheader:                         ; preds = %4
  %wide.trip.count38 = zext i32 %1 to i64
  %10 = sext i32 %1 to i64
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.preheader, %._crit_edge21.us
  %indvars.iv40 = phi i64 [ 0, %._crit_edge.us.preheader ], [ %indvars.iv.next41, %._crit_edge21.us ]
  %11 = mul nsw i64 %indvars.iv40, %10
  br label %12

; <label>:12:                                     ; preds = %._crit_edge7.us, %._crit_edge.us
  %indvars.iv36 = phi i64 [ 0, %._crit_edge.us ], [ %indvars.iv.next37, %._crit_edge7.us ]
  %13 = add nsw i64 %11, %indvars.iv36
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 20
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %._crit_edge7.us

; <label>:17:                                     ; preds = %12
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc6.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %18) #6
  br label %._crit_edge7.us

._crit_edge7.us:                                  ; preds = %12, %17
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv40, i64 %indvars.iv36
  %21 = load double, double* %20, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %21) #7
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next37, %wide.trip.count38
  br i1 %exitcond39, label %._crit_edge21.us, label %12

._crit_edge21.us:                                 ; preds = %._crit_edge7.us
  %indvars.iv.next41 = add nsw i64 %indvars.iv40, 1
  %23 = icmp slt i64 %indvars.iv.next41, %10
  br i1 %23, label %._crit_edge.us, label %.loopexit4.loopexit

.loopexit4.loopexit:                              ; preds = %._crit_edge21.us
  br label %.loopexit4

.loopexit4:                                       ; preds = %.loopexit4.loopexit, %4
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  %28 = icmp sgt i32 %0, 0
  br i1 %28, label %._crit_edge8.lr.ph, label %.loopexit

._crit_edge8.lr.ph:                               ; preds = %.loopexit4
  %29 = icmp sgt i32 %1, 0
  %30 = sext i32 %1 to i64
  %31 = sext i32 %0 to i64
  br i1 %29, label %._crit_edge8.us.preheader, label %.loopexit

._crit_edge8.us.preheader:                        ; preds = %._crit_edge8.lr.ph
  %32 = zext i32 %1 to i64
  br label %._crit_edge8.us

._crit_edge8.us:                                  ; preds = %._crit_edge8.us.preheader, %._crit_edge12.us
  %indvars.iv34 = phi i64 [ 0, %._crit_edge8.us.preheader ], [ %indvars.iv.next35, %._crit_edge12.us ]
  %33 = mul nsw i64 %indvars.iv34, %30
  br label %34

; <label>:34:                                     ; preds = %._crit_edge9.us, %._crit_edge8.us
  %indvars.iv = phi i64 [ 0, %._crit_edge8.us ], [ %indvars.iv.next, %._crit_edge9.us ]
  %35 = add nsw i64 %33, %indvars.iv
  %36 = trunc i64 %35 to i32
  %37 = srem i32 %36, 20
  %38 = icmp eq i32 %37, 0
  br i1 %38, label %39, label %._crit_edge9.us

; <label>:39:                                     ; preds = %34
  %40 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %40) #6
  br label %._crit_edge9.us

._crit_edge9.us:                                  ; preds = %34, %39
  %41 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv34, i64 %indvars.iv
  %43 = load double, double* %42, align 8
  %44 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %41, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %43) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next, %32
  br i1 %exitcond1, label %._crit_edge12.us, label %34

._crit_edge12.us:                                 ; preds = %._crit_edge9.us
  %indvars.iv.next35 = add nsw i64 %indvars.iv34, 1
  %45 = icmp slt i64 %indvars.iv.next35, %31
  br i1 %45, label %._crit_edge8.us, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %._crit_edge12.us
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %._crit_edge8.lr.ph, %.loopexit4
  %46 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %47 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %46, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  %48 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %49 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %48) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
