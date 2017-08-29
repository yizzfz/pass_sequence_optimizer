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
  br i1 %3, label %.preheader6.lr.ph, label %._crit_edge22.thread

._crit_edge22.thread:                             ; preds = %2
  %4 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %.preheader._crit_edge

.preheader6.lr.ph:                                ; preds = %2
  %5 = sitofp i32 %0 to double
  %6 = add i32 %0, -2
  %7 = zext i32 %6 to i64
  %8 = sext i32 %0 to i64
  %wide.trip.count74 = zext i32 %0 to i64
  br label %.lr.ph17

.lr.ph17:                                         ; preds = %._crit_edge21, %.preheader6.lr.ph
  %indvars.iv72 = phi i64 [ 0, %.preheader6.lr.ph ], [ %indvars.iv.next73, %._crit_edge21 ]
  %indvars.iv70 = phi i64 [ 1, %.preheader6.lr.ph ], [ %indvars.iv.next71, %._crit_edge21 ]
  %9 = add nuw nsw i64 %indvars.iv72, 1
  %10 = sub i64 %7, %indvars.iv72
  %11 = shl i64 %10, 3
  %12 = and i64 %11, 34359738360
  br label %13

; <label>:13:                                     ; preds = %13, %.lr.ph17
  %indvars.iv55 = phi i64 [ %indvars.iv.next56, %13 ], [ 0, %.lr.ph17 ]
  %14 = sub nsw i64 0, %indvars.iv55
  %15 = trunc i64 %14 to i32
  %16 = srem i32 %15, %0
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, %5
  %19 = fadd double %18, 1.000000e+00
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv72, i64 %indvars.iv55
  store double %19, double* %20, align 8
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %exitcond60 = icmp eq i64 %indvars.iv.next56, %indvars.iv70
  br i1 %exitcond60, label %._crit_edge18, label %13

._crit_edge18:                                    ; preds = %13
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  %21 = icmp slt i64 %indvars.iv.next73, %8
  br i1 %21, label %.lr.ph20.preheader, label %._crit_edge21

.lr.ph20.preheader:                               ; preds = %._crit_edge18
  %22 = add nuw nsw i64 %12, 8
  %scevgep67 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %9
  %23 = mul nuw nsw i64 %indvars.iv72, 2000
  %scevgep68 = getelementptr double, double* %scevgep67, i64 %23
  %scevgep6869 = bitcast double* %scevgep68 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep6869, i8 0, i64 %22, i32 8, i1 false)
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %.lr.ph20.preheader, %._crit_edge18
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv72, i64 %indvars.iv72
  store double 1.000000e+00, double* %24, align 8
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1
  %exitcond75 = icmp eq i64 %indvars.iv.next73, %wide.trip.count74
  br i1 %exitcond75, label %._crit_edge22, label %.lr.ph17

._crit_edge22:                                    ; preds = %._crit_edge21
  %25 = icmp sgt i32 %0, 0
  %26 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br i1 %25, label %.preheader5.us.preheader, label %.preheader._crit_edge

.preheader5.us.preheader:                         ; preds = %._crit_edge22
  %27 = add i32 %0, -1
  %28 = zext i32 %27 to i64
  %29 = shl nuw nsw i64 %28, 3
  %30 = add nuw nsw i64 %29, 8
  %xtraiter52 = and i32 %0, 3
  %lcmp.mod53 = icmp eq i32 %xtraiter52, 0
  br i1 %lcmp.mod53, label %.preheader5.us.prol.loopexit, label %._crit_edge16.us.prol.preheader

._crit_edge16.us.prol.preheader:                  ; preds = %.preheader5.us.preheader
  %31 = add nsw i32 %xtraiter52, -1
  %32 = zext i32 %31 to i64
  br label %._crit_edge16.us.prol

._crit_edge16.us.prol:                            ; preds = %._crit_edge16.us.prol.preheader, %._crit_edge16.us.prol
  %indvars.iv48.prol = phi i64 [ %indvars.iv.next49.prol, %._crit_edge16.us.prol ], [ 0, %._crit_edge16.us.prol.preheader ]
  %prol.iter54 = phi i32 [ %prol.iter54.sub, %._crit_edge16.us.prol ], [ %xtraiter52, %._crit_edge16.us.prol.preheader ]
  %33 = mul nuw nsw i64 %indvars.iv48.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %26, i64 %33
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 %30, i32 8, i1 false)
  %indvars.iv.next49.prol = add nuw nsw i64 %indvars.iv48.prol, 1
  %prol.iter54.sub = add nsw i32 %prol.iter54, -1
  %prol.iter54.cmp = icmp eq i32 %prol.iter54.sub, 0
  br i1 %prol.iter54.cmp, label %.preheader5.us.prol.loopexit.loopexit, label %._crit_edge16.us.prol, !llvm.loop !1

.preheader5.us.prol.loopexit.loopexit:            ; preds = %._crit_edge16.us.prol
  %34 = add nuw nsw i64 %32, 1
  br label %.preheader5.us.prol.loopexit

.preheader5.us.prol.loopexit:                     ; preds = %.preheader5.us.prol.loopexit.loopexit, %.preheader5.us.preheader
  %indvars.iv48.unr = phi i64 [ 0, %.preheader5.us.preheader ], [ %34, %.preheader5.us.prol.loopexit.loopexit ]
  %35 = icmp ult i32 %27, 3
  br i1 %35, label %.preheader1.preheader.lr.ph, label %._crit_edge16.us.3.preheader

._crit_edge16.us.3.preheader:                     ; preds = %.preheader5.us.prol.loopexit
  %wide.trip.count50.3 = zext i32 %0 to i64
  %36 = add nsw i64 %wide.trip.count50.3, -4
  %37 = sub nsw i64 %36, %indvars.iv48.unr
  %38 = lshr i64 %37, 2
  %39 = and i64 %38, 1
  %lcmp.mod = icmp eq i64 %39, 0
  br i1 %lcmp.mod, label %._crit_edge16.us.3.prol.preheader, label %._crit_edge16.us.3.prol.loopexit

._crit_edge16.us.3.prol.preheader:                ; preds = %._crit_edge16.us.3.preheader
  br label %._crit_edge16.us.3.prol

._crit_edge16.us.3.prol:                          ; preds = %._crit_edge16.us.3.prol.preheader
  %40 = mul nuw nsw i64 %indvars.iv48.unr, 16000
  %scevgep.prol83 = getelementptr i8, i8* %26, i64 %40
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol83, i8 0, i64 %30, i32 8, i1 false)
  %41 = mul nsw i64 %indvars.iv48.unr, 16000
  %42 = add i64 %41, 16000
  %scevgep.1.prol = getelementptr i8, i8* %26, i64 %42
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.prol, i8 0, i64 %30, i32 8, i1 false)
  %43 = mul nsw i64 %indvars.iv48.unr, 16000
  %44 = add i64 %43, 32000
  %scevgep.2.prol = getelementptr i8, i8* %26, i64 %44
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.prol, i8 0, i64 %30, i32 8, i1 false)
  %45 = mul nsw i64 %indvars.iv48.unr, 16000
  %46 = add i64 %45, 48000
  %scevgep.3.prol = getelementptr i8, i8* %26, i64 %46
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.prol, i8 0, i64 %30, i32 8, i1 false)
  %indvars.iv.next49.3.prol = add nsw i64 %indvars.iv48.unr, 4
  br label %._crit_edge16.us.3.prol.loopexit

._crit_edge16.us.3.prol.loopexit:                 ; preds = %._crit_edge16.us.3.prol, %._crit_edge16.us.3.preheader
  %indvars.iv48.unr84 = phi i64 [ %indvars.iv48.unr, %._crit_edge16.us.3.preheader ], [ %indvars.iv.next49.3.prol, %._crit_edge16.us.3.prol ]
  %47 = icmp eq i64 %38, 0
  br i1 %47, label %.preheader4, label %._crit_edge16.us.3.preheader.new

._crit_edge16.us.3.preheader.new:                 ; preds = %._crit_edge16.us.3.prol.loopexit
  br label %._crit_edge16.us.3

.preheader4.unr-lcssa:                            ; preds = %._crit_edge16.us.3
  br label %.preheader4

.preheader4:                                      ; preds = %._crit_edge16.us.3.prol.loopexit, %.preheader4.unr-lcssa
  %48 = icmp sgt i32 %0, 0
  br i1 %48, label %.preheader1.preheader.lr.ph, label %.preheader._crit_edge

.preheader1.preheader.lr.ph:                      ; preds = %.preheader5.us.prol.loopexit, %.preheader4
  %xtraiter34 = and i32 %0, 1
  %wide.trip.count38 = zext i32 %0 to i64
  %wide.trip.count30.1 = zext i32 %0 to i64
  %wide.trip.count42 = zext i32 %0 to i64
  %49 = icmp eq i32 %xtraiter34, 0
  %50 = icmp eq i32 %0, 1
  %51 = bitcast i8* %26 to [2000 x [2000 x double]]*
  %52 = bitcast i8* %26 to [2000 x [2000 x double]]*
  %sunkaddr = ptrtoint [2000 x double]* %1 to i64
  br label %.preheader3.us.us.preheader

.preheader3.us.us.preheader:                      ; preds = %.preheader1._crit_edge.us, %.preheader1.preheader.lr.ph
  %indvars.iv40 = phi i64 [ %indvars.iv.next41, %.preheader1._crit_edge.us ], [ 0, %.preheader1.preheader.lr.ph ]
  %sunkaddr78 = shl i64 %indvars.iv40, 3
  %sunkaddr79 = add i64 %sunkaddr, %sunkaddr78
  %sunkaddr80 = inttoptr i64 %sunkaddr79 to double*
  br label %.preheader3.us.us

.preheader1._crit_edge.us:                        ; preds = %._crit_edge8.us.us
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %exitcond43 = icmp eq i64 %indvars.iv.next41, %wide.trip.count42
  br i1 %exitcond43, label %.preheader.preheader, label %.preheader3.us.us.preheader

.preheader3.us.us:                                ; preds = %._crit_edge8.us.us, %.preheader3.us.us.preheader
  %indvars.iv36 = phi i64 [ 0, %.preheader3.us.us.preheader ], [ %indvars.iv.next37, %._crit_edge8.us.us ]
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv36, i64 %indvars.iv40
  br i1 %49, label %.prol.loopexit33, label %54

; <label>:54:                                     ; preds = %.preheader3.us.us
  %55 = load double, double* %53, align 8
  %56 = load double, double* %sunkaddr80, align 8
  %57 = fmul double %55, %56
  %58 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %52, i64 0, i64 %indvars.iv36, i64 0
  %59 = load double, double* %58, align 8
  %60 = fadd double %59, %57
  store double %60, double* %58, align 8
  br label %.prol.loopexit33

.prol.loopexit33:                                 ; preds = %.preheader3.us.us, %54
  %indvars.iv28.unr.ph = phi i64 [ 1, %54 ], [ 0, %.preheader3.us.us ]
  br i1 %50, label %._crit_edge8.us.us, label %.preheader3.us.us.new.preheader

.preheader3.us.us.new.preheader:                  ; preds = %.prol.loopexit33
  br label %.preheader3.us.us.new

._crit_edge8.us.us.loopexit:                      ; preds = %.preheader3.us.us.new
  br label %._crit_edge8.us.us

._crit_edge8.us.us:                               ; preds = %._crit_edge8.us.us.loopexit, %.prol.loopexit33
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next37, %wide.trip.count38
  br i1 %exitcond39, label %.preheader1._crit_edge.us, label %.preheader3.us.us

.preheader3.us.us.new:                            ; preds = %.preheader3.us.us.new.preheader, %.preheader3.us.us.new
  %indvars.iv28 = phi i64 [ %indvars.iv.next29.1, %.preheader3.us.us.new ], [ %indvars.iv28.unr.ph, %.preheader3.us.us.new.preheader ]
  %61 = load double, double* %53, align 8
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv28, i64 %indvars.iv40
  %63 = load double, double* %62, align 8
  %64 = fmul double %61, %63
  %65 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %51, i64 0, i64 %indvars.iv36, i64 %indvars.iv28
  %66 = load double, double* %65, align 8
  %67 = fadd double %66, %64
  store double %67, double* %65, align 8
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %68 = load double, double* %53, align 8
  %69 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next29, i64 %indvars.iv40
  %70 = load double, double* %69, align 8
  %71 = fmul double %68, %70
  %72 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %51, i64 0, i64 %indvars.iv36, i64 %indvars.iv.next29
  %73 = load double, double* %72, align 8
  %74 = fadd double %73, %71
  store double %74, double* %72, align 8
  %indvars.iv.next29.1 = add nuw nsw i64 %indvars.iv28, 2
  %exitcond31.1 = icmp eq i64 %indvars.iv.next29.1, %wide.trip.count30.1
  br i1 %exitcond31.1, label %._crit_edge8.us.us.loopexit, label %.preheader3.us.us.new

.preheader.preheader:                             ; preds = %.preheader1._crit_edge.us
  %75 = icmp sgt i32 %0, 0
  br i1 %75, label %.preheader2.us.preheader, label %.preheader._crit_edge

.preheader2.us.preheader:                         ; preds = %.preheader.preheader
  %76 = add i32 %0, -1
  %xtraiter = and i32 %0, 3
  %wide.trip.count27 = zext i32 %0 to i64
  %wide.trip.count.3 = zext i32 %0 to i64
  %77 = add nsw i32 %xtraiter, -1
  %78 = zext i32 %77 to i64
  %79 = add nuw nsw i64 %78, 1
  %80 = icmp eq i32 %xtraiter, 0
  %81 = icmp ult i32 %76, 3
  %82 = bitcast i8* %26 to [2000 x [2000 x double]]*
  %83 = bitcast i8* %26 to [2000 x [2000 x double]]*
  br label %.preheader2.us

.preheader2.us:                                   ; preds = %._crit_edge.us, %.preheader2.us.preheader
  %indvars.iv25 = phi i64 [ 0, %.preheader2.us.preheader ], [ %indvars.iv.next26, %._crit_edge.us ]
  br i1 %80, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.preheader2.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %84 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %83, i64 0, i64 %indvars.iv25, i64 %indvars.iv.prol
  %85 = bitcast double* %84 to i64*
  %86 = load i64, i64* %85, align 8
  %87 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv25, i64 %indvars.iv.prol
  %88 = bitcast double* %87 to i64*
  store i64 %86, i64* %88, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !3

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.preheader2.us
  %indvars.iv.unr = phi i64 [ 0, %.preheader2.us ], [ %79, %.prol.loopexit.loopexit ]
  br i1 %81, label %._crit_edge.us, label %.preheader2.us.new.preheader

.preheader2.us.new.preheader:                     ; preds = %.prol.loopexit
  br label %.preheader2.us.new

.preheader2.us.new:                               ; preds = %.preheader2.us.new.preheader, %.preheader2.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.preheader2.us.new ], [ %indvars.iv.unr, %.preheader2.us.new.preheader ]
  %89 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %82, i64 0, i64 %indvars.iv25, i64 %indvars.iv
  %90 = bitcast double* %89 to i64*
  %91 = load i64, i64* %90, align 8
  %92 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv25, i64 %indvars.iv
  %93 = bitcast double* %92 to i64*
  store i64 %91, i64* %93, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %94 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %82, i64 0, i64 %indvars.iv25, i64 %indvars.iv.next
  %95 = bitcast double* %94 to i64*
  %96 = load i64, i64* %95, align 8
  %97 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv25, i64 %indvars.iv.next
  %98 = bitcast double* %97 to i64*
  store i64 %96, i64* %98, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %99 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %82, i64 0, i64 %indvars.iv25, i64 %indvars.iv.next.1
  %100 = bitcast double* %99 to i64*
  %101 = load i64, i64* %100, align 8
  %102 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv25, i64 %indvars.iv.next.1
  %103 = bitcast double* %102 to i64*
  store i64 %101, i64* %103, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %104 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %82, i64 0, i64 %indvars.iv25, i64 %indvars.iv.next.2
  %105 = bitcast double* %104 to i64*
  %106 = load i64, i64* %105, align 8
  %107 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv25, i64 %indvars.iv.next.2
  %108 = bitcast double* %107 to i64*
  store i64 %106, i64* %108, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %._crit_edge.us.loopexit, label %.preheader2.us.new

._crit_edge.us.loopexit:                          ; preds = %.preheader2.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond = icmp eq i64 %indvars.iv.next26, %wide.trip.count27
  br i1 %exitcond, label %.preheader._crit_edge.loopexit, label %.preheader2.us

.preheader._crit_edge.loopexit:                   ; preds = %._crit_edge.us
  br label %.preheader._crit_edge

.preheader._crit_edge:                            ; preds = %.preheader._crit_edge.loopexit, %._crit_edge22, %._crit_edge22.thread, %.preheader4, %.preheader.preheader
  %109 = phi i8* [ %26, %.preheader.preheader ], [ %26, %.preheader4 ], [ %26, %._crit_edge22 ], [ %4, %._crit_edge22.thread ], [ %26, %.preheader._crit_edge.loopexit ]
  tail call void @free(i8* %109) #4
  ret void

._crit_edge16.us.3:                               ; preds = %._crit_edge16.us.3, %._crit_edge16.us.3.preheader.new
  %indvars.iv48 = phi i64 [ %indvars.iv48.unr84, %._crit_edge16.us.3.preheader.new ], [ %indvars.iv.next49.3.1, %._crit_edge16.us.3 ]
  %110 = mul nuw nsw i64 %indvars.iv48, 16000
  %scevgep = getelementptr i8, i8* %26, i64 %110
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %30, i32 8, i1 false)
  %111 = mul i64 %indvars.iv48, 16000
  %112 = add i64 %111, 16000
  %scevgep.1 = getelementptr i8, i8* %26, i64 %112
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 %30, i32 8, i1 false)
  %113 = mul i64 %indvars.iv48, 16000
  %114 = add i64 %113, 32000
  %scevgep.2 = getelementptr i8, i8* %26, i64 %114
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 %30, i32 8, i1 false)
  %115 = mul i64 %indvars.iv48, 16000
  %116 = add i64 %115, 48000
  %scevgep.3 = getelementptr i8, i8* %26, i64 %116
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 %30, i32 8, i1 false)
  %indvars.iv.next49.3 = add nsw i64 %indvars.iv48, 4
  %117 = mul nuw nsw i64 %indvars.iv.next49.3, 16000
  %scevgep.185 = getelementptr i8, i8* %26, i64 %117
  call void @llvm.memset.p0i8.i64(i8* %scevgep.185, i8 0, i64 %30, i32 8, i1 false)
  %118 = mul i64 %indvars.iv.next49.3, 16000
  %119 = add i64 %118, 16000
  %scevgep.1.1 = getelementptr i8, i8* %26, i64 %119
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.1, i8 0, i64 %30, i32 8, i1 false)
  %120 = mul i64 %indvars.iv.next49.3, 16000
  %121 = add i64 %120, 32000
  %scevgep.2.1 = getelementptr i8, i8* %26, i64 %121
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.1, i8 0, i64 %30, i32 8, i1 false)
  %122 = mul i64 %indvars.iv.next49.3, 16000
  %123 = add i64 %122, 48000
  %scevgep.3.1 = getelementptr i8, i8* %26, i64 %123
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.1, i8 0, i64 %30, i32 8, i1 false)
  %indvars.iv.next49.3.1 = add nsw i64 %indvars.iv48, 8
  %exitcond51.3.1 = icmp eq i64 %indvars.iv.next49.3.1, %wide.trip.count50.3
  br i1 %exitcond51.3.1, label %.preheader4.unr-lcssa, label %._crit_edge16.us.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu(i32, [2000 x double]* nocapture) unnamed_addr #2 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %.preheader3.preheader, label %._crit_edge7

.preheader3.preheader:                            ; preds = %2
  %wide.trip.count43 = zext i32 %0 to i64
  %wide.trip.count37 = zext i32 %0 to i64
  br label %.preheader3

.preheader3:                                      ; preds = %.preheader3.preheader, %._crit_edge6
  %indvars.iv41 = phi i64 [ %indvars.iv.next42, %._crit_edge6 ], [ 0, %.preheader3.preheader ]
  %4 = add nuw i64 %indvars.iv41, 4294967295
  %5 = icmp sgt i64 %indvars.iv41, 0
  br i1 %5, label %.preheader1.preheader, label %._crit_edge6

.preheader1.preheader:                            ; preds = %.preheader3
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv41, i64 0
  br label %.preheader1

.preheader.lr.ph:                                 ; preds = %._crit_edge
  %7 = icmp sgt i64 %indvars.iv41, 0
  br i1 %7, label %.preheader.us.preheader, label %._crit_edge6

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %xtraiter3045 = and i64 %indvars.iv41, 1
  %8 = trunc i64 %4 to i32
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv41, i64 0
  %10 = icmp eq i64 %xtraiter3045, 0
  %11 = icmp eq i32 %8, 0
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge5.us
  %indvars.iv35 = phi i64 [ %indvars.iv.next36, %._crit_edge5.us ], [ %indvars.iv41, %.preheader.us.preheader ]
  %12 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv41, i64 %indvars.iv35
  %.pre11 = load double, double* %12, align 8
  br i1 %10, label %.prol.loopexit29, label %13

; <label>:13:                                     ; preds = %.preheader.us
  %14 = load double, double* %9, align 8
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv35
  %16 = load double, double* %15, align 8
  %17 = fmul double %14, %16
  %18 = fsub double %.pre11, %17
  store double %18, double* %12, align 8
  br label %.prol.loopexit29

.prol.loopexit29:                                 ; preds = %.preheader.us, %13
  %indvars.iv23.unr.ph = phi i64 [ 1, %13 ], [ 0, %.preheader.us ]
  %.unr32.ph = phi double [ %18, %13 ], [ %.pre11, %.preheader.us ]
  br i1 %11, label %._crit_edge5.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit29
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv23 = phi i64 [ %indvars.iv.next24.1, %.preheader.us.new ], [ %indvars.iv23.unr.ph, %.preheader.us.new.preheader ]
  %19 = phi double [ %31, %.preheader.us.new ], [ %.unr32.ph, %.preheader.us.new.preheader ]
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv41, i64 %indvars.iv23
  %21 = load double, double* %20, align 8
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv23, i64 %indvars.iv35
  %23 = load double, double* %22, align 8
  %24 = fmul double %21, %23
  %25 = fsub double %19, %24
  store double %25, double* %12, align 8
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv41, i64 %indvars.iv.next24
  %27 = load double, double* %26, align 8
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next24, i64 %indvars.iv35
  %29 = load double, double* %28, align 8
  %30 = fmul double %27, %29
  %31 = fsub double %25, %30
  store double %31, double* %12, align 8
  %indvars.iv.next24.1 = add nuw nsw i64 %indvars.iv23, 2
  %exitcond27.1 = icmp eq i64 %indvars.iv.next24.1, %indvars.iv41
  br i1 %exitcond27.1, label %._crit_edge5.us.loopexit, label %.preheader.us.new

._crit_edge5.us.loopexit:                         ; preds = %.preheader.us.new
  br label %._crit_edge5.us

._crit_edge5.us:                                  ; preds = %._crit_edge5.us.loopexit, %.prol.loopexit29
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next36, %wide.trip.count37
  br i1 %exitcond38, label %._crit_edge6.loopexit, label %.preheader.us

.preheader1:                                      ; preds = %.preheader1.preheader, %._crit_edge
  %indvars.iv17 = phi i64 [ %indvars.iv.next18, %._crit_edge ], [ 0, %.preheader1.preheader ]
  %32 = add nuw i64 %indvars.iv17, 4294967295
  %33 = icmp sgt i64 %indvars.iv17, 0
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv41, i64 %indvars.iv17
  %.pre = load double, double* %34, align 8
  br i1 %33, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader1
  %xtraiter46 = and i64 %indvars.iv17, 1
  %lcmp.mod = icmp eq i64 %xtraiter46, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %35

; <label>:35:                                     ; preds = %.lr.ph
  %36 = load double, double* %6, align 8
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv17
  %38 = load double, double* %37, align 8
  %39 = fmul double %36, %38
  %40 = fsub double %.pre, %39
  store double %40, double* %34, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %35
  %indvars.iv.unr.ph = phi i64 [ 1, %35 ], [ 0, %.lr.ph ]
  %.unr.ph = phi double [ %40, %35 ], [ %.pre, %.lr.ph ]
  %.lcssa.unr.ph = phi double [ %40, %35 ], [ undef, %.lr.ph ]
  %41 = trunc i64 %32 to i32
  %42 = icmp eq i32 %41, 0
  br i1 %42, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %43 = phi double [ %55, %.lr.ph.new ], [ %.unr.ph, %.lr.ph.new.preheader ]
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv41, i64 %indvars.iv
  %45 = load double, double* %44, align 8
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv, i64 %indvars.iv17
  %47 = load double, double* %46, align 8
  %48 = fmul double %45, %47
  %49 = fsub double %43, %48
  store double %49, double* %34, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv41, i64 %indvars.iv.next
  %51 = load double, double* %50, align 8
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv17
  %53 = load double, double* %52, align 8
  %54 = fmul double %51, %53
  %55 = fsub double %49, %54
  store double %55, double* %34, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv17
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader1, %.prol.loopexit
  %56 = phi double [ %.lcssa.unr.ph, %.prol.loopexit ], [ %.pre, %.preheader1 ], [ %55, %._crit_edge.loopexit ]
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv17, i64 %indvars.iv17
  %58 = load double, double* %57, align 8
  %59 = fdiv double %56, %58
  store double %59, double* %34, align 8
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %exitcond = icmp eq i64 %indvars.iv.next18, %indvars.iv41
  br i1 %exitcond, label %.preheader.lr.ph, label %.preheader1

._crit_edge6.loopexit:                            ; preds = %._crit_edge5.us
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge6.loopexit, %.preheader3, %.preheader.lr.ph
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next42, %wide.trip.count43
  br i1 %exitcond44, label %._crit_edge7.loopexit, label %.preheader3

._crit_edge7.loopexit:                            ; preds = %._crit_edge6
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge7.loopexit, %2
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [2000 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader.us.preheader, label %._crit_edge1

.preheader.us.preheader:                          ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  %wide.trip.count4 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv2 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next3, %._crit_edge.us ]
  %9 = mul nsw i64 %indvars.iv2, %8
  br label %10

; <label>:10:                                     ; preds = %17, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %17 ]
  %11 = add nsw i64 %indvars.iv, %9
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
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv2, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %10

._crit_edge.us:                                   ; preds = %17
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv2, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next3, %wide.trip.count4
  br i1 %exitcond5, label %._crit_edge1.loopexit, label %.preheader.us

._crit_edge1.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge1.loopexit, %2
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
