; ModuleID = 'A.ll'
source_filename = "lu.c"
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

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_lu(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %5 = icmp sgt i32 %0, 42
  br i1 %5, label %6, label %11

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %11

; <label>:9:                                      ; preds = %6
  %10 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %10)
  br label %11

; <label>:11:                                     ; preds = %6, %9, %2
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]* nocapture) unnamed_addr #0 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %.preheader6.lr.ph, label %._crit_edge69.thread

._crit_edge69.thread:                             ; preds = %2
  %4 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %._crit_edge7

.preheader6.lr.ph:                                ; preds = %2
  %5 = sitofp i32 %0 to double
  %6 = sext i32 %0 to i64
  %7 = add i32 %0, -2
  %8 = zext i32 %7 to i64
  %9 = zext i32 %0 to i64
  br label %.preheader6

.preheader6:                                      ; preds = %._crit_edge60, %.preheader6.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge60 ], [ 1, %.preheader6.lr.ph ]
  %indvars.iv70 = phi i64 [ %indvars.iv.next71, %._crit_edge60 ], [ 0, %.preheader6.lr.ph ]
  %10 = shl i64 %indvars.iv70, 32
  %sext = add i64 %10, 4294967296
  %11 = ashr exact i64 %sext, 32
  %12 = sub i64 %8, %indvars.iv70
  %13 = shl i64 %12, 3
  %14 = and i64 %13, 34359738360
  br label %15

; <label>:15:                                     ; preds = %.preheader6, %15
  %indvars.iv52 = phi i64 [ 0, %.preheader6 ], [ %indvars.iv.next53, %15 ]
  %16 = sub nsw i64 0, %indvars.iv52
  %17 = trunc i64 %16 to i32
  %18 = srem i32 %17, %0
  %19 = sitofp i32 %18 to double
  %20 = fdiv double %19, %5
  %21 = fadd double %20, 1.000000e+00
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv70, i64 %indvars.iv52
  store double %21, double* %22, align 8
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond = icmp eq i64 %indvars.iv.next53, %indvars.iv
  br i1 %exitcond, label %._crit_edge51, label %15

._crit_edge51:                                    ; preds = %15
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1
  %23 = icmp slt i64 %indvars.iv.next71, %6
  br i1 %23, label %.lr.ph59.preheader, label %._crit_edge60

.lr.ph59.preheader:                               ; preds = %._crit_edge51
  %24 = add nuw nsw i64 %14, 8
  %scevgep86 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv70, i64 %11
  %25 = bitcast double* %scevgep86 to i8*
  call void @llvm.memset.p0i8.i64(i8* %25, i8 0, i64 %24, i32 8, i1 false)
  br label %._crit_edge60

._crit_edge60:                                    ; preds = %.lr.ph59.preheader, %._crit_edge51
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv70, i64 %indvars.iv70
  store double 1.000000e+00, double* %26, align 8
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %exitcond88 = icmp eq i64 %indvars.iv.next71, %9
  br i1 %exitcond88, label %.preheader5.lr.ph.split.us, label %.preheader6

.preheader5.lr.ph.split.us:                       ; preds = %._crit_edge60
  %27 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %28 = shl nuw nsw i64 %9, 3
  %29 = add nsw i64 %9, -1
  %xtraiter80 = and i64 %9, 3
  %lcmp.mod81 = icmp eq i64 %xtraiter80, 0
  br i1 %lcmp.mod81, label %.preheader5.us.prol.loopexit, label %._crit_edge41.us.prol.preheader

._crit_edge41.us.prol.preheader:                  ; preds = %.preheader5.lr.ph.split.us
  br label %._crit_edge41.us.prol

._crit_edge41.us.prol:                            ; preds = %._crit_edge41.us.prol.preheader, %._crit_edge41.us.prol
  %indvars.iv46.us.prol = phi i64 [ %indvars.iv.next47.us.prol, %._crit_edge41.us.prol ], [ 0, %._crit_edge41.us.prol.preheader ]
  %prol.iter82 = phi i64 [ %prol.iter82.sub, %._crit_edge41.us.prol ], [ %xtraiter80, %._crit_edge41.us.prol.preheader ]
  %30 = mul nuw nsw i64 %indvars.iv46.us.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %27, i64 %30
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 %28, i32 8, i1 false)
  %indvars.iv.next47.us.prol = add nuw nsw i64 %indvars.iv46.us.prol, 1
  %prol.iter82.sub = add nsw i64 %prol.iter82, -1
  %prol.iter82.cmp = icmp eq i64 %prol.iter82.sub, 0
  br i1 %prol.iter82.cmp, label %.preheader5.us.prol.loopexit.loopexit, label %._crit_edge41.us.prol, !llvm.loop !1

.preheader5.us.prol.loopexit.loopexit:            ; preds = %._crit_edge41.us.prol
  br label %.preheader5.us.prol.loopexit

.preheader5.us.prol.loopexit:                     ; preds = %.preheader5.us.prol.loopexit.loopexit, %.preheader5.lr.ph.split.us
  %indvars.iv46.us.unr = phi i64 [ 0, %.preheader5.lr.ph.split.us ], [ %xtraiter80, %.preheader5.us.prol.loopexit.loopexit ]
  %31 = icmp ult i64 %29, 3
  br i1 %31, label %.preheader3.lr.ph, label %._crit_edge41.us.3.preheader

._crit_edge41.us.3.preheader:                     ; preds = %.preheader5.us.prol.loopexit
  %32 = add nsw i64 %9, -4
  %33 = sub nsw i64 %32, %indvars.iv46.us.unr
  %34 = lshr i64 %33, 2
  %35 = and i64 %34, 1
  %lcmp.mod = icmp eq i64 %35, 0
  br i1 %lcmp.mod, label %._crit_edge41.us.3.prol.preheader, label %._crit_edge41.us.3.prol.loopexit

._crit_edge41.us.3.prol.preheader:                ; preds = %._crit_edge41.us.3.preheader
  br label %._crit_edge41.us.3.prol

._crit_edge41.us.3.prol:                          ; preds = %._crit_edge41.us.3.prol.preheader
  %36 = mul nuw nsw i64 %indvars.iv46.us.unr, 16000
  %scevgep.prol94 = getelementptr i8, i8* %27, i64 %36
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol94, i8 0, i64 %28, i32 8, i1 false)
  %37 = add nuw nsw i64 %36, 16000
  %scevgep.1.prol = getelementptr i8, i8* %27, i64 %37
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.prol, i8 0, i64 %28, i32 8, i1 false)
  %38 = add nuw nsw i64 %36, 32000
  %scevgep.2.prol = getelementptr i8, i8* %27, i64 %38
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.prol, i8 0, i64 %28, i32 8, i1 false)
  %39 = add nuw nsw i64 %36, 48000
  %scevgep.3.prol = getelementptr i8, i8* %27, i64 %39
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.prol, i8 0, i64 %28, i32 8, i1 false)
  %indvars.iv.next47.us.3.prol = or i64 %indvars.iv46.us.unr, 4
  br label %._crit_edge41.us.3.prol.loopexit

._crit_edge41.us.3.prol.loopexit:                 ; preds = %._crit_edge41.us.3.prol, %._crit_edge41.us.3.preheader
  %indvars.iv46.us.unr95 = phi i64 [ %indvars.iv46.us.unr, %._crit_edge41.us.3.preheader ], [ %indvars.iv.next47.us.3.prol, %._crit_edge41.us.3.prol ]
  %40 = icmp eq i64 %34, 0
  br i1 %40, label %.preheader3.lr.ph.loopexit, label %._crit_edge41.us.3.preheader.new

._crit_edge41.us.3.preheader.new:                 ; preds = %._crit_edge41.us.3.prol.loopexit
  br label %._crit_edge41.us.3

.preheader3.lr.ph.loopexit.unr-lcssa:             ; preds = %._crit_edge41.us.3
  br label %.preheader3.lr.ph.loopexit

.preheader3.lr.ph.loopexit:                       ; preds = %._crit_edge41.us.3.prol.loopexit, %.preheader3.lr.ph.loopexit.unr-lcssa
  br label %.preheader3.lr.ph

.preheader3.lr.ph:                                ; preds = %.preheader3.lr.ph.loopexit, %.preheader5.us.prol.loopexit
  %xtraiter78 = and i64 %9, 1
  %41 = icmp eq i64 %xtraiter78, 0
  %42 = icmp eq i32 %0, 1
  %43 = bitcast i8* %27 to [2000 x [2000 x double]]*
  %44 = bitcast i8* %27 to [2000 x [2000 x double]]*
  %sunkaddr = ptrtoint [2000 x double]* %1 to i64
  br label %.preheader2.us.us.preheader

.preheader2.us.us.preheader:                      ; preds = %.preheader3.lr.ph, %._crit_edge18.us
  %indvars.iv23.us = phi i64 [ 0, %.preheader3.lr.ph ], [ %indvars.iv.next24.us, %._crit_edge18.us ]
  %sunkaddr90 = shl i64 %indvars.iv23.us, 3
  %sunkaddr91 = add i64 %sunkaddr, %sunkaddr90
  %sunkaddr92 = inttoptr i64 %sunkaddr91 to double*
  br label %.preheader2.us.us

._crit_edge18.us:                                 ; preds = %._crit_edge13.us.us
  %indvars.iv.next24.us = add nuw nsw i64 %indvars.iv23.us, 1
  %exitcond26.us = icmp eq i64 %indvars.iv.next24.us, %9
  br i1 %exitcond26.us, label %.preheader.us.preheader, label %.preheader2.us.us.preheader

.preheader.us.preheader:                          ; preds = %._crit_edge18.us
  %45 = icmp eq i64 %xtraiter80, 0
  %46 = icmp ult i64 %29, 3
  %47 = bitcast i8* %27 to [2000 x [2000 x double]]*
  %48 = bitcast i8* %27 to [2000 x [2000 x double]]*
  br label %.preheader.us

.preheader2.us.us:                                ; preds = %.preheader2.us.us.preheader, %._crit_edge13.us.us
  %indvars.iv19.us.us = phi i64 [ %indvars.iv.next20.us.us, %._crit_edge13.us.us ], [ 0, %.preheader2.us.us.preheader ]
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv19.us.us, i64 %indvars.iv23.us
  br i1 %41, label %.prol.loopexit77, label %50

; <label>:50:                                     ; preds = %.preheader2.us.us
  %51 = load double, double* %49, align 8
  %52 = load double, double* %sunkaddr92, align 8
  %53 = fmul double %51, %52
  %54 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %44, i64 0, i64 %indvars.iv19.us.us, i64 0
  %55 = load double, double* %54, align 8
  %56 = fadd double %55, %53
  store double %56, double* %54, align 8
  br label %.prol.loopexit77

.prol.loopexit77:                                 ; preds = %.preheader2.us.us, %50
  %indvars.iv14.us.us.unr.ph = phi i64 [ 1, %50 ], [ 0, %.preheader2.us.us ]
  br i1 %42, label %._crit_edge13.us.us, label %.preheader2.us.us.new.preheader

.preheader2.us.us.new.preheader:                  ; preds = %.prol.loopexit77
  br label %.preheader2.us.us.new

._crit_edge13.us.us.loopexit:                     ; preds = %.preheader2.us.us.new
  br label %._crit_edge13.us.us

._crit_edge13.us.us:                              ; preds = %._crit_edge13.us.us.loopexit, %.prol.loopexit77
  %indvars.iv.next20.us.us = add nuw nsw i64 %indvars.iv19.us.us, 1
  %exitcond22.us.us = icmp eq i64 %indvars.iv.next20.us.us, %9
  br i1 %exitcond22.us.us, label %._crit_edge18.us, label %.preheader2.us.us

.preheader2.us.us.new:                            ; preds = %.preheader2.us.us.new.preheader, %.preheader2.us.us.new
  %indvars.iv14.us.us = phi i64 [ %indvars.iv.next15.us.us.1, %.preheader2.us.us.new ], [ %indvars.iv14.us.us.unr.ph, %.preheader2.us.us.new.preheader ]
  %57 = load double, double* %49, align 8
  %58 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv14.us.us, i64 %indvars.iv23.us
  %59 = load double, double* %58, align 8
  %60 = fmul double %57, %59
  %61 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %43, i64 0, i64 %indvars.iv19.us.us, i64 %indvars.iv14.us.us
  %62 = load double, double* %61, align 8
  %63 = fadd double %62, %60
  store double %63, double* %61, align 8
  %indvars.iv.next15.us.us = add nuw nsw i64 %indvars.iv14.us.us, 1
  %64 = load double, double* %49, align 8
  %65 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next15.us.us, i64 %indvars.iv23.us
  %66 = load double, double* %65, align 8
  %67 = fmul double %64, %66
  %68 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %43, i64 0, i64 %indvars.iv19.us.us, i64 %indvars.iv.next15.us.us
  %69 = load double, double* %68, align 8
  %70 = fadd double %69, %67
  store double %70, double* %68, align 8
  %indvars.iv.next15.us.us.1 = add nuw nsw i64 %indvars.iv14.us.us, 2
  %exitcond17.us.us.1 = icmp eq i64 %indvars.iv.next15.us.us.1, %9
  br i1 %exitcond17.us.us.1, label %._crit_edge13.us.us.loopexit, label %.preheader2.us.us.new

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv8.us = phi i64 [ %indvars.iv.next9.us, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br i1 %45, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.preheader.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.us.prol = phi i64 [ %indvars.iv.next.us.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter80, %.prol.preheader.preheader ]
  %71 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %48, i64 0, i64 %indvars.iv8.us, i64 %indvars.iv.us.prol
  %72 = bitcast double* %71 to i64*
  %73 = load i64, i64* %72, align 8
  %74 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv8.us, i64 %indvars.iv.us.prol
  %75 = bitcast double* %74 to i64*
  store i64 %73, i64* %75, align 8
  %indvars.iv.next.us.prol = add nuw nsw i64 %indvars.iv.us.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !3

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.preheader.us
  %indvars.iv.us.unr = phi i64 [ 0, %.preheader.us ], [ %xtraiter80, %.prol.loopexit.loopexit ]
  br i1 %46, label %._crit_edge.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv.us = phi i64 [ %indvars.iv.next.us.3, %.preheader.us.new ], [ %indvars.iv.us.unr, %.preheader.us.new.preheader ]
  %76 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %47, i64 0, i64 %indvars.iv8.us, i64 %indvars.iv.us
  %77 = bitcast double* %76 to i64*
  %78 = load i64, i64* %77, align 8
  %79 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv8.us, i64 %indvars.iv.us
  %80 = bitcast double* %79 to i64*
  store i64 %78, i64* %80, align 8
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv.us, 1
  %81 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %47, i64 0, i64 %indvars.iv8.us, i64 %indvars.iv.next.us
  %82 = bitcast double* %81 to i64*
  %83 = load i64, i64* %82, align 8
  %84 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv8.us, i64 %indvars.iv.next.us
  %85 = bitcast double* %84 to i64*
  store i64 %83, i64* %85, align 8
  %indvars.iv.next.us.1 = add nsw i64 %indvars.iv.us, 2
  %86 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %47, i64 0, i64 %indvars.iv8.us, i64 %indvars.iv.next.us.1
  %87 = bitcast double* %86 to i64*
  %88 = load i64, i64* %87, align 8
  %89 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv8.us, i64 %indvars.iv.next.us.1
  %90 = bitcast double* %89 to i64*
  store i64 %88, i64* %90, align 8
  %indvars.iv.next.us.2 = add nsw i64 %indvars.iv.us, 3
  %91 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %47, i64 0, i64 %indvars.iv8.us, i64 %indvars.iv.next.us.2
  %92 = bitcast double* %91 to i64*
  %93 = load i64, i64* %92, align 8
  %94 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv8.us, i64 %indvars.iv.next.us.2
  %95 = bitcast double* %94 to i64*
  store i64 %93, i64* %95, align 8
  %indvars.iv.next.us.3 = add nuw nsw i64 %indvars.iv.us, 4
  %exitcond.us.3 = icmp eq i64 %indvars.iv.next.us.3, %9
  br i1 %exitcond.us.3, label %._crit_edge.us.loopexit, label %.preheader.us.new

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit
  %indvars.iv.next9.us = add nuw nsw i64 %indvars.iv8.us, 1
  %exitcond11.us = icmp eq i64 %indvars.iv.next9.us, %9
  br i1 %exitcond11.us, label %._crit_edge7.loopexit, label %.preheader.us

._crit_edge7.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge7.loopexit, %._crit_edge69.thread
  %96 = phi i8* [ %4, %._crit_edge69.thread ], [ %27, %._crit_edge7.loopexit ]
  tail call void @free(i8* %96) #4
  ret void

._crit_edge41.us.3:                               ; preds = %._crit_edge41.us.3, %._crit_edge41.us.3.preheader.new
  %indvars.iv46.us = phi i64 [ %indvars.iv46.us.unr95, %._crit_edge41.us.3.preheader.new ], [ %indvars.iv.next47.us.3.1, %._crit_edge41.us.3 ]
  %97 = mul i64 %indvars.iv46.us, 16000
  %scevgep = getelementptr i8, i8* %27, i64 %97
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %28, i32 8, i1 false)
  %98 = add i64 %97, 16000
  %scevgep.1 = getelementptr i8, i8* %27, i64 %98
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 %28, i32 8, i1 false)
  %99 = add i64 %97, 32000
  %scevgep.2 = getelementptr i8, i8* %27, i64 %99
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 %28, i32 8, i1 false)
  %100 = add i64 %97, 48000
  %scevgep.3 = getelementptr i8, i8* %27, i64 %100
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 %28, i32 8, i1 false)
  %101 = mul i64 %indvars.iv46.us, 16000
  %102 = add i64 %101, 64000
  %scevgep.196 = getelementptr i8, i8* %27, i64 %102
  call void @llvm.memset.p0i8.i64(i8* %scevgep.196, i8 0, i64 %28, i32 8, i1 false)
  %103 = add i64 %101, 80000
  %scevgep.1.1 = getelementptr i8, i8* %27, i64 %103
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.1, i8 0, i64 %28, i32 8, i1 false)
  %104 = add i64 %101, 96000
  %scevgep.2.1 = getelementptr i8, i8* %27, i64 %104
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.1, i8 0, i64 %28, i32 8, i1 false)
  %105 = add i64 %101, 112000
  %scevgep.3.1 = getelementptr i8, i8* %27, i64 %105
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.1, i8 0, i64 %28, i32 8, i1 false)
  %indvars.iv.next47.us.3.1 = add nsw i64 %indvars.iv46.us, 8
  %exitcond49.us.3.1 = icmp eq i64 %indvars.iv.next47.us.3.1, %9
  br i1 %exitcond49.us.3.1, label %.preheader3.lr.ph.loopexit.unr-lcssa, label %._crit_edge41.us.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu(i32, [2000 x double]* nocapture) unnamed_addr #2 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %.preheader3.lr.ph, label %._crit_edge35

.preheader3.lr.ph:                                ; preds = %2
  %wide.trip.count27.us = zext i32 %0 to i64
  br label %.preheader3

.preheader3:                                      ; preds = %._crit_edge22, %.preheader3.lr.ph
  %indvars.iv54 = phi i64 [ %indvars.iv.next55, %._crit_edge22 ], [ 0, %.preheader3.lr.ph ]
  %4 = icmp sgt i64 %indvars.iv54, 0
  br i1 %4, label %.preheader1.preheader, label %._crit_edge22

.preheader1.preheader:                            ; preds = %.preheader3
  %5 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv54, i64 0
  br label %.preheader1

.preheader.us.preheader:                          ; preds = %._crit_edge
  %xtraiter51 = and i64 %indvars.iv54, 1
  %6 = icmp eq i64 %xtraiter51, 0
  %7 = icmp eq i64 %indvars.iv54, 1
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge15.us
  %indvars.iv25.us = phi i64 [ %indvars.iv.next26.us, %._crit_edge15.us ], [ %indvars.iv54, %.preheader.us.preheader ]
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv54, i64 %indvars.iv25.us
  %.pre42 = load double, double* %8, align 8
  br i1 %6, label %.prol.loopexit50, label %9

; <label>:9:                                      ; preds = %.preheader.us
  %10 = load double, double* %5, align 8
  %11 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv25.us
  %12 = load double, double* %11, align 8
  %13 = fmul double %10, %12
  %14 = fsub double %.pre42, %13
  store double %14, double* %8, align 8
  br label %.prol.loopexit50

.prol.loopexit50:                                 ; preds = %.preheader.us, %9
  %.unr53.ph = phi double [ %14, %9 ], [ %.pre42, %.preheader.us ]
  %indvars.iv16.us.unr.ph = phi i64 [ 1, %9 ], [ 0, %.preheader.us ]
  br i1 %7, label %._crit_edge15.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit50
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %15 = phi double [ %27, %.preheader.us.new ], [ %.unr53.ph, %.preheader.us.new.preheader ]
  %indvars.iv16.us = phi i64 [ %indvars.iv.next17.us.1, %.preheader.us.new ], [ %indvars.iv16.us.unr.ph, %.preheader.us.new.preheader ]
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv54, i64 %indvars.iv16.us
  %17 = load double, double* %16, align 8
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv16.us, i64 %indvars.iv25.us
  %19 = load double, double* %18, align 8
  %20 = fmul double %17, %19
  %21 = fsub double %15, %20
  store double %21, double* %8, align 8
  %indvars.iv.next17.us = add nuw nsw i64 %indvars.iv16.us, 1
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv54, i64 %indvars.iv.next17.us
  %23 = load double, double* %22, align 8
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next17.us, i64 %indvars.iv25.us
  %25 = load double, double* %24, align 8
  %26 = fmul double %23, %25
  %27 = fsub double %21, %26
  store double %27, double* %8, align 8
  %indvars.iv.next17.us.1 = add nuw nsw i64 %indvars.iv16.us, 2
  %exitcond21.us.1 = icmp eq i64 %indvars.iv.next17.us.1, %indvars.iv54
  br i1 %exitcond21.us.1, label %._crit_edge15.us.loopexit, label %.preheader.us.new

._crit_edge15.us.loopexit:                        ; preds = %.preheader.us.new
  br label %._crit_edge15.us

._crit_edge15.us:                                 ; preds = %._crit_edge15.us.loopexit, %.prol.loopexit50
  %indvars.iv.next26.us = add nuw nsw i64 %indvars.iv25.us, 1
  %exitcond28.us = icmp eq i64 %indvars.iv.next26.us, %wide.trip.count27.us
  br i1 %exitcond28.us, label %._crit_edge22.loopexit, label %.preheader.us

.preheader1:                                      ; preds = %.preheader1.preheader, %._crit_edge
  %indvars.iv43 = phi i64 [ %indvars.iv.next44, %._crit_edge ], [ 0, %.preheader1.preheader ]
  %28 = icmp sgt i64 %indvars.iv43, 0
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv54, i64 %indvars.iv43
  %.pre = load double, double* %29, align 8
  br i1 %28, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader1
  %xtraiter = and i64 %indvars.iv43, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %30

; <label>:30:                                     ; preds = %.lr.ph
  %31 = load double, double* %5, align 8
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv43
  %33 = load double, double* %32, align 8
  %34 = fmul double %31, %33
  %35 = fsub double %.pre, %34
  store double %35, double* %29, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %30
  %.lcssa.unr.ph = phi double [ %35, %30 ], [ undef, %.lr.ph ]
  %.unr.ph = phi double [ %35, %30 ], [ %.pre, %.lr.ph ]
  %indvars.iv.unr.ph = phi i64 [ 1, %30 ], [ 0, %.lr.ph ]
  %36 = icmp eq i64 %indvars.iv43, 1
  br i1 %36, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %37 = phi double [ %49, %.lr.ph.new ], [ %.unr.ph, %.lr.ph.new.preheader ]
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv54, i64 %indvars.iv
  %39 = load double, double* %38, align 8
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv, i64 %indvars.iv43
  %41 = load double, double* %40, align 8
  %42 = fmul double %39, %41
  %43 = fsub double %37, %42
  store double %43, double* %29, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv54, i64 %indvars.iv.next
  %45 = load double, double* %44, align 8
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv43
  %47 = load double, double* %46, align 8
  %48 = fmul double %45, %47
  %49 = fsub double %43, %48
  store double %49, double* %29, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond45.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv43
  br i1 %exitcond45.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader1, %.prol.loopexit
  %50 = phi double [ %.lcssa.unr.ph, %.prol.loopexit ], [ %.pre, %.preheader1 ], [ %49, %._crit_edge.loopexit ]
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv43, i64 %indvars.iv43
  %52 = load double, double* %51, align 8
  %53 = fdiv double %50, %52
  store double %53, double* %29, align 8
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond = icmp eq i64 %indvars.iv.next44, %indvars.iv54
  br i1 %exitcond, label %.preheader.us.preheader, label %.preheader1

._crit_edge22.loopexit:                           ; preds = %._crit_edge15.us
  br label %._crit_edge22

._crit_edge22:                                    ; preds = %._crit_edge22.loopexit, %.preheader3
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next55, %wide.trip.count27.us
  br i1 %exitcond39, label %._crit_edge35.loopexit, label %.preheader3

._crit_edge35.loopexit:                           ; preds = %._crit_edge22
  br label %._crit_edge35

._crit_edge35:                                    ; preds = %._crit_edge35.loopexit, %2
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [2000 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader.lr.ph, label %._crit_edge1

.preheader.lr.ph:                                 ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count.us = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv2.us = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next3.us, %._crit_edge.us ]
  %9 = mul nsw i64 %indvars.iv2.us, %8
  br label %10

; <label>:10:                                     ; preds = %17, %.preheader.us
  %indvars.iv.us = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.us, %17 ]
  %11 = add nsw i64 %indvars.iv.us, %9
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #6
  br label %17

; <label>:17:                                     ; preds = %15, %10
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv2.us, i64 %indvars.iv.us
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #7
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, %wide.trip.count.us
  br i1 %exitcond.us, label %._crit_edge.us, label %10

._crit_edge.us:                                   ; preds = %17
  %indvars.iv.next3.us = add nuw nsw i64 %indvars.iv2.us, 1
  %exitcond5.us = icmp eq i64 %indvars.iv.next3.us, %wide.trip.count.us
  br i1 %exitcond5.us, label %._crit_edge1.loopexit, label %.preheader.us

._crit_edge1.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge1.loopexit, %2
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

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
